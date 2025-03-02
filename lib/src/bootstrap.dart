import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennaxia_geolocation/l10n/string_hardcoded.dart';
import 'package:tennaxia_geolocation/src/app/view/app.dart';
import 'package:tennaxia_geolocation/src/exceptions/async_error_logger.dart';
import 'package:tennaxia_geolocation/src/exceptions/error_logger.dart';
import 'package:tennaxia_geolocation/src/features/user/application/user_provider.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };

  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (error, stack) {
    errorLogger.logError(error, stack);
    return true;
  };

  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Intl.defaultLocale = Platform.localeName;

  await Supabase.initialize(
    url: Env.supabaseAPIUrl,
    anonKey: Env.supabaseAnonKey,
  );

  MapboxOptions.setAccessToken(Env.mapboxAccessToken);

  final container = ProviderContainer(
    observers: [AsyncErrorLogger()],
  )..read(userFutureProvider);

  // * Register error handlers. For more info, see: https://docs.flutter.dev/testing/errors
  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);

  final root = UncontrolledProviderScope(
    container: container,
    child: const App(),
  );

  runApp(root);
}

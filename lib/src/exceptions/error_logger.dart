import 'package:flutter/foundation.dart';
import 'package:health_pitstop/src/exceptions/app_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    // * This can be replaced with a call to a crash reporting tool
    debugPrint('$error, $stackTrace');
  }

  void logAppException(AppException exception) {
    // * This can be replaced with a call to a crash reporting tool
    debugPrint('$exception');
  }
}

final errorLoggerProvider = Provider<ErrorLogger>((ref) {
  return ErrorLogger();
});

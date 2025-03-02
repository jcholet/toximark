import 'package:flutter/material.dart';
import 'package:tennaxia_geolocation/l10n/l10n.dart';
import 'package:tennaxia_geolocation/l10n/string_hardcoded.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      onGenerateTitle: (_) => 'Tipsst'.hardcoded,
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pitstop/src/app/routes/go_router_refresh_stream.dart';
import 'package:health_pitstop/src/features/authentication/authentication.dart';
import 'package:health_pitstop/src/features/home/home.dart';
import 'package:health_pitstop/src/features/onboarding/onboarding.dart';
import 'package:health_pitstop/src/features/welcome/welcome.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
///
/// ```dart
/// context.goNamed(AppRoute.home.name)
/// ```
enum AppRoute {
  startUp,
  welcome,
  signIn,
  signUp,
  onboarding,
  onboardingSuccessStep,
  home,
  userProfile,
}

@riverpod
GoRouter goRouter(Ref ref) {
  // Rebuild GoRouter when app startup state changes
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/welcome',
    // debugLogDiagnostics: true,
    redirect: (_, state) {
      final currentUser = authRepository.currentUser;
      final path = state.uri.path;

      if (currentUser != null) {
        // Check if the user has completed the onboarding
        if (currentUser.isComplete) {
          if (path == '/startup' ||
              path.startsWith('/welcome') ||
              path.startsWith('/onboarding')) {
            return '/home';
          }
        } else {
          if (!path.startsWith('/onboarding')) {
            return '/onboarding';
          }
        }
      } else {
        if (path == '/startup' ||
            path.startsWith('/onboarding') ||
            path.startsWith('/savedPlaces') ||
            path.startsWith('/home') ||
            path.startsWith('/user') ||
            path.startsWith('/settings')) {
          return '/welcome';
        }
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.onAuthStateChange),
    routes: [
      GoRoute(
        path: '/startUp',
        name: AppRoute.startUp.name,
        builder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      GoRoute(
        path: '/welcome',
        name: AppRoute.welcome.name,
        pageBuilder: (_, __) => const NoTransitionPage(
          child: WelcomeView(),
        ),
        routes: [
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            builder: (_, __) => const SignInView(),
          ),
          GoRoute(
            path: 'signUp',
            name: AppRoute.signUp.name,
            builder: (_, __) => const SignUpView(),
          ),
        ],
      ),
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        pageBuilder: (_, __) => const NoTransitionPage(
          child: OnboardingView(),
        ),
        routes: [
          GoRoute(
            path: 'success',
            name: AppRoute.onboardingSuccessStep.name,
            pageBuilder: (_, __) {
              return CustomTransitionPage(
                transitionDuration: AppTime.fastest,
                reverseTransitionDuration: AppTime.fastest,
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const SuccessStep(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (_, __) => const NoTransitionPage(
          child: HomeView(),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennaxia_geolocation/src/app/routes/go_router_refresh_stream.dart';
import 'package:tennaxia_geolocation/src/features/authentication/authentication.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/transporter/view/transporter_pick_up_confirm_signature_view.dart';
import 'package:tennaxia_geolocation/src/features/transporter/view/transporter_pick_up_signing_view.dart';
import 'package:tennaxia_geolocation/src/features/user/application/user_provider.dart';
import 'package:tennaxia_geolocation/src/features/user/view/user_profile_view.dart';

part 'app_router.g.dart';

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
///
/// ```dart
/// context.goNamed(AppRoute.home.name)
/// ```
enum AppRoute {
  startUp,
  signIn,
  homeSorting,
  homeProducer,
  pickUpDetail,
  producerSigning,
  confirmSignature,
  transporterSignature,
  transporterConfirmSignature,
  userProfile,
}

@riverpod
GoRouter goRouter(Ref ref) {
  // Rebuild GoRouter when app startup state changes
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/signIn',
    // debugLogDiagnostics: true,
    redirect: (_, state) {
      final user = authRepository.currentUser;
      final path = state.uri.path;

      // If no user, always redirect to sign in
      if (user == null) {
        return '/signIn';
      }

      final userRole =
          authRepository.currentUser!.appMetadata['role'] as String?;

      // Allow access to user profile for all authenticated users
      if (path == '/userProfile') {
        return null;
      }

      // Allow users to stay on their proper home routes and sub-routes
      if ((userRole == 'producer' && path.startsWith('/homeProducer')) ||
          (userRole == 'sorting_center' && path.startsWith('/homeSorting'))) {
        return null;
      }

      // Redirect to appropriate home page based on role
      switch (userRole) {
        case 'producer':
          return '/homeProducer';
        case 'sorting_center':
          return '/homeSorting';
        default:
          return '/signIn';
      }
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
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (_, __) => const SignInView(),
      ),
      GoRoute(
        path: '/homeProducer',
        name: AppRoute.homeProducer.name,
        builder: (_, __) => const HomeProducerView(),
        routes: [
          GoRoute(
            path: 'pickUpDetail',
            name: AppRoute.pickUpDetail.name,
            builder: (_, state) {
              final producerPickUp = state.extra! as ProducerPickUp;
              return PickUpDetailView(producerPickUp: producerPickUp);
            },
            routes: [
              GoRoute(
                path: 'producerSigning',
                name: AppRoute.producerSigning.name,
                builder: (_, state) {
                  final producerPickUp = state.extra! as ProducerPickUp;
                  return ProducerSigningView(
                    producerPickUp: producerPickUp,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'confirmSignature',
                    name: AppRoute.confirmSignature.name,
                    builder: (_, state) {
                      final signExtra = state.extra! as SignExtra;
                      return ConfirmSignatureView(
                        signExtra: signExtra,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'transporterSignature',
                        name: AppRoute.transporterSignature.name,
                        builder: (_, state) {
                          final producerPickUp = state.extra! as ProducerPickUp;
                          return TransporterPickUpSigningView(
                            producerPickUp: producerPickUp,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'transporterConfirmSignature',
                            name: AppRoute.transporterConfirmSignature.name,
                            builder: (_, state) {
                              final signExtra = state.extra! as SignExtra;
                              return TransporterPickUpConfirmSignatureView(
                                signExtra: signExtra,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/userProfile',
        name: AppRoute.userProfile.name,
        builder: (_, __) => const UserProfileView(),
      ),
    ],
  );
}

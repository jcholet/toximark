import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/producer/widgets/widgets.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class HomeProducerView extends ConsumerWidget {
  const HomeProducerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final producerPickUpFuture = ref.watch(producerPickUpFutureProvider);

    return producerPickUpFuture.when(
      data: (pickUps) {
        final pickUpsInProgress =
            pickUps.where((pickUp) => pickUp.status == 'En cours').toList();
        final pickUpsPlanified =
            pickUps.where((pickUp) => pickUp.status == 'Planifié').toList();
        final pickUpsEnded =
            pickUps.where((pickUp) => pickUp.status == 'Terminé').toList();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'ToxiMark',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 22,
                color: AppColor.primary,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ScrollableColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collectes',
                  style: context.textTheme.displayMedium!.copyWith(
                    fontSize: 32,
                  ),
                ),
                if (pickUps.isEmpty) ...[
                  const Text("Aucune collecte n'est encore prévue"),
                ] else ...[
                  const VSpace.lg(),
                  if (pickUpsInProgress.isNotEmpty) ...[
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.all(
                          AppCorner.lgRadius,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          'En cours',
                          style: context.textTheme.displayMedium!.copyWith(
                            color: AppColor.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const VSpace.lg(),
                    Column(
                      children: pickUpsInProgress
                          .map(
                            (pickUp) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () => context.pushNamed(
                                    AppRoute.pickUpDetail.name,
                                    extra: pickUp,
                                  ),
                                  child: PickingCard(
                                    producerPickUp: pickUp,
                                  ),
                                ),
                                const VSpace.lg(),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  const VSpace.lg(),
                  if (pickUpsPlanified.isNotEmpty) ...[
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.all(
                          AppCorner.lgRadius,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          'À venir',
                          style: context.textTheme.displayMedium!.copyWith(
                            color: AppColor.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const VSpace.lg(),
                    Column(
                      children: pickUpsPlanified
                          .map(
                            (pickUp) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () => context.pushNamed(
                                    AppRoute.pickUpDetail.name,
                                    extra: pickUp,
                                  ),
                                  child: PickingCard(
                                    producerPickUp: pickUp,
                                  ),
                                ),
                                const VSpace.lg(),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  const VSpace.lg(),
                  if (pickUpsEnded.isNotEmpty) ...[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.all(
                          AppCorner.lgRadius,
                        ),
                        border: Border.all(
                          color: AppColor.primary,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          'Historique',
                          style: context.textTheme.displayMedium!.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const VSpace.lg(),
                    Column(
                      children: pickUpsEnded
                          .map(
                            (pickUp) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () => context.pushNamed(
                                    AppRoute.pickUpDetail.name,
                                    extra: pickUp,
                                  ),
                                  child: PickingCard(
                                    producerPickUp: pickUp,
                                  ),
                                ),
                                const VSpace.lg(),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  const VSpace.lg(),
                ],
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Column(
            children: [
              Text('Erreur: $error'),
              Text('Stack trace: $stackTrace'),
            ],
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

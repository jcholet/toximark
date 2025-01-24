import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/producer/widgets/widgets.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class PickUpDetailView extends StatelessWidget {
  const PickUpDetailView({
    required this.producerPickUp,
    super.key,
  });

  final ProducerPickUp producerPickUp;

  @override
  Widget build(BuildContext context) {
    final steps = [true, false, false];
    if (producerPickUp.status == 'En cours') {
      steps[1] = true;
    } else if (producerPickUp.status == 'Terminé') {
      steps[1] = true;
      steps[2] = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Détail de la collecte',
          style: context.textTheme.displayMedium!.copyWith(
            fontSize: 26,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppCorner.lgBorder,
                border: Border.all(
                  color: AppColor.primary,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  producerPickUp.description,
                  style: context.textTheme.displayMedium!.copyWith(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const VSpace.xs(),
            Text(
              producerPickUp.wasteCode.toString(),
              style: context.textTheme.bodyLarge,
            ),
            const VSpace.lg(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StepWidget(
                  isActive: steps[0],
                  iconData: PhosphorIconsRegular.trash,
                  description: 'En attente',
                ),
                SizedBox(
                  width: 25,
                  child: Divider(
                    color: steps[1] ? AppColor.primary : AppColor.mediumGrey,
                    thickness: 2,
                  ),
                ),
                StepWidget(
                  isActive: steps[1],
                  iconData: PhosphorIconsRegular.truckTrailer,
                  description: 'En transit',
                ),
                SizedBox(
                  width: 25,
                  child: Divider(
                    color: steps[2] ? AppColor.primary : AppColor.mediumGrey,
                    thickness: 2,
                  ),
                ),
                StepWidget(
                  isActive: steps[2],
                  iconData: PhosphorIconsRegular.recycle,
                  description: 'Traité',
                ),
              ],
            ),
            const VSpace.lg(),
            Column(
              children: [
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.primary,
                        ),
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: PhosphorIcon(
                          PhosphorIconsDuotone.truck,
                          size: 26,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    const HSpace.sm(),
                    Text(
                      'Transporteur',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
                const VSpace.sm(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primary,
                            ),
                            borderRadius: AppCorner.lgBorder,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: PhosphorIcon(
                              PhosphorIconsDuotone.trash,
                              size: 26,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const HSpace.sm(),
                        Text(
                          '${producerPickUp.quantity} ${producerPickUp.unit}',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const HSpace.xl(),
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primary,
                            ),
                            borderRadius: AppCorner.lgBorder,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: PhosphorIcon(
                              PhosphorIconsDuotone.package,
                              size: 26,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const HSpace.sm(),
                        Text(
                          producerPickUp.packagingType,
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                const VSpace.sm(),
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.primary,
                        ),
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: PhosphorIcon(
                          PhosphorIconsDuotone.calendarDots,
                          size: 26,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    const HSpace.sm(),
                    Text(
                      '${DateFormat('dd MMM yyyy').format(producerPickUp.pickUpDate)}'
                      ' - '
                      '${DateFormat('dd MMM yyyy').format(producerPickUp.dropOffDate)}',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            const VSpace.xxl(),
            Text(
              'Points de collecte et de dépôt',
              style: context.textTheme.displaySmall,
            ),
            const VSpace.md(),
            SizedBox(
              height: 200,
              child: SizedBox(
                height: 180,
                child: ClipRRect(
                  borderRadius: AppCorner.lgBorder,
                  child: FlutterMap(
                    options: MapOptions(
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.none,
                      ),
                      initialCenter: LatLng(
                        producerPickUp.pickUpLatitude!,
                        producerPickUp.pickUpLongitude!,
                      ),
                      initialZoom: 7,
                    ),
                    children: [
                      AppTileLayer(
                        retinaMode: RetinaMode.isHighDensity(context),
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              producerPickUp.pickUpLatitude!,
                              producerPickUp.pickUpLongitude!,
                            ),
                            alignment: Alignment.topCenter,
                            height: 28,
                            child: const PhosphorIcon(
                              PhosphorIconsDuotone.mapPin,
                              size: 30,
                              color: AppColor.primary,
                              duotoneSecondaryColor: AppColor.white,
                              duotoneSecondaryOpacity: 1,
                            ),
                          ),
                          Marker(
                            point: LatLng(
                              producerPickUp.dropOffLatitude!,
                              producerPickUp.dropOffLongitude!,
                            ),
                            alignment: Alignment.topCenter,
                            height: 28,
                            child: const PhosphorIcon(
                              PhosphorIconsDuotone.mapPin,
                              size: 30,
                              color: AppColor.green,
                              duotoneSecondaryColor: AppColor.white,
                              duotoneSecondaryOpacity: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VSpace.lg(),
            const Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsDuotone.mapPin,
                  size: 25,
                  color: AppColor.primary,
                  duotoneSecondaryColor: AppColor.white,
                  duotoneSecondaryOpacity: 1,
                ),
                HSpace.xs(),
                Text('Point de collecte'),
                HSpace.md(),
                PhosphorIcon(
                  PhosphorIconsDuotone.mapPin,
                  size: 25,
                  color: AppColor.green,
                  duotoneSecondaryColor: AppColor.white,
                  duotoneSecondaryOpacity: 1,
                ),
                HSpace.xs(),
                Text('Point de dépot'),
              ],
            ),
            if (producerPickUp.status == 'Planifié') ...[
              const Spacer(),
              AppButton.primary(
                onPressed: () {
                  context.goNamed(
                    AppRoute.producerSigning.name,
                    extra: producerPickUp,
                  );
                },
                child: const Text('Passer à la signature'),
              ),
              const VSpace.xl(),
            ],
          ],
        ),
      ),
    );
  }
}

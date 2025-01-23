import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
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
            const VSpace.md(),
            Text(
              'Statut : ${producerPickUp.status}',
              style: context.textTheme.bodyLarge,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: AppCorner.lgBorder,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO(jonas): Changer avec des icones à la place du texte
                    Text(
                      'Transporteur',
                      style: context.textTheme.bodyLarge,
                    ),
                    const VSpace.xxs(),
                    Text(
                      'Quantité : ${producerPickUp.quantity} ${producerPickUp.unit}',
                      style: context.textTheme.bodyLarge,
                    ),
                    const VSpace.xxs(),
                    Text(
                      'Conditionnement : ${producerPickUp.packagingType}',
                      style: context.textTheme.bodyLarge,
                    ),
                    const VSpace.xxs(),
                    Text(
                      'Date de collecte : ${DateFormat('dd MMM yyyy').format(producerPickUp.pickUpDate)}',
                      style: context.textTheme.bodyLarge,
                    ),
                    const VSpace.xxs(),
                    Text(
                      'Date de livraison : ${DateFormat('dd MMM yyyy').format(producerPickUp.dropOffDate)}',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const VSpace.xxl(),
            const VSpace.xs(),
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

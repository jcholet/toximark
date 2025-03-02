import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:signature/signature.dart' hide Point;
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/producer/models/producer_pick_up.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/producer/view/producer_signing_controller.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class ProducerSigningView extends ConsumerStatefulWidget {
  const ProducerSigningView({
    required this.producerPickUp,
    super.key,
  });

  final ProducerPickUp producerPickUp;

  @override
  ProducerSigningState createState() => ProducerSigningState();
}

class ProducerSigningState extends ConsumerState<ProducerSigningView> {
  ProducerPickUp get producerPickUp => widget.producerPickUp;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(producerSigningControllerProvider.notifier).determinePosition();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final positionState = ref.watch(producerSigningControllerProvider);
    const initialZoom = 12.0;
    final SignatureController _controller = SignatureController(
      penStrokeWidth: 4,
      exportBackgroundColor: AppColor.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          producerPickUp.description,
          style: context.textTheme.displayMedium!.copyWith(
            fontSize: 22,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signature du producteur',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 24,
                color: AppColor.primary,
              ),
            ),
            const VSpace.xxl(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: PhosphorIcon(
                          PhosphorIconsDuotone.trash,
                          size: 26,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const HSpace.md(),
                    Text(
                      '${producerPickUp.quantity} ${producerPickUp.unit}',
                      style: context.textTheme.displayMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const VSpace.lg(),
                Row(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: PhosphorIcon(
                          PhosphorIconsDuotone.package,
                          size: 26,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const HSpace.md(),
                    Text(
                      producerPickUp.packagingType,
                      style: context.textTheme.displayMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const VSpace.xxl(),
            Text(
              'Position actuelle',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            const VSpace.lg(),
            Container(
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: AppCorner.lgBorder,
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: AppCorner.lgBorder,
                child: positionState.when(
                  data: (position) {
                    return MapWidget(
                      cameraOptions: CameraOptions(
                        zoom: initialZoom,
                      ),
                      styleUri:
                          'mapbox://styles/${Env.mapboxUsername}/${Env.mapboxStyleId}',
                      onMapCreated: (controller) async {
                        await controller.scaleBar.updateSettings(
                          ScaleBarSettings(enabled: false),
                        );

                        await controller.attribution.updateSettings(
                          AttributionSettings(enabled: false),
                        );

                        await controller.setCamera(
                          CameraOptions(
                            center: Point(
                              coordinates: Position(
                                position != null
                                    ? position.longitude
                                    : -0.76667,
                                position != null
                                    ? position.latitude
                                    : 48.066669,
                              ),
                            ),
                          ),
                        );

                        await controller.location.updateSettings(
                          LocationComponentSettings(
                            enabled: true,
                          ),
                        );

                        await controller.gestures.updateSettings(
                          GesturesSettings(
                            rotateEnabled: false,
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Impossible de récupérer la position actuelle',
                      ),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            const VSpace.xl(),
            Text(
              'Signature',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            const VSpace.md(),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primary,
                  width: 2,
                ),
                borderRadius: AppCorner.lgBorder,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Signature(
                  controller: _controller,
                  backgroundColor: AppColor.white,
                ),
              ),
            ),
            const VSpace.md(),
            const Spacer(),
            positionState.when(
              data: (position) {
                return AppButton.primary(
                  onPressed: () async {
                    final signatureBytes = await _controller.toPngBytes();
                    if (signatureBytes == null) {
                      await showAdaptiveDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog.adaptive(
                            title: const Text('Signature manquante'),
                            content:
                                const Text('Pour continuer, veuillez signer.'),
                            actions: <Widget>[
                              CupertinoButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text(
                                  'Ok',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    await context.pushNamed(
                      AppRoute.confirmSignature.name,
                      extra: SignExtra(
                        signatureBytes: signatureBytes,
                        producerPickUp: producerPickUp,
                        latitude: position != null ? position.latitude : 0.0,
                        longitude: position != null ? position.longitude : 0.0,
                      ),
                    );
                  },
                  child: const Text('Continuer'),
                );
              },
              error: (error, stackTrace) {
                return const AppButton.primary(
                  child: Text('Impossible de récupérer la position actuelle'),
                );
              },
              loading: () {
                return const AppButton.primary(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const VSpace.xl(),
          ],
        ),
      ),
    );
  }
}

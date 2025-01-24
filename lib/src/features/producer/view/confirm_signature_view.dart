import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/signing/signing.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class ConfirmSignatureView extends ConsumerStatefulWidget {
  const ConfirmSignatureView({
    required this.signExtra,
    super.key,
  });

  final SignExtra signExtra;

  @override
  _ConfirmSignatureViewState createState() => _ConfirmSignatureViewState();
}

class _ConfirmSignatureViewState extends ConsumerState<ConfirmSignatureView> {
  ProducerPickUp get producerPickUp => widget.signExtra.producerPickUp;
  Uint8List get signature => widget.signExtra.signatureBytes;
  double get latitude => widget.signExtra.latitude;
  double get longitude => widget.signExtra.longitude;
  String code = '';

  @override
  Widget build(BuildContext context) {
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
              'Confirmation de la signature',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 22,
                color: AppColor.primary,
              ),
            ),
            const VSpace.lg(),
            Text(
              'Veuillez confirmer la signature ci-dessous',
              style: context.textTheme.bodyLarge,
            ),
            const VSpace.lg(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primary,
                  width: 2,
                ),
                borderRadius: AppCorner.lgBorder,
              ),
              width: double.infinity,
              height: 200,
              child: Image.memory(
                signature,
                fit: BoxFit.contain,
              ),
            ),
            const VSpace.xl(),
            Text(
              'Vérification du code',
              style: context.textTheme.displayMedium!.copyWith(
                fontSize: 22,
              ),
            ),
            const VSpace.xl(),
            Center(
              child: VerificationCode(
                textStyle: context.textTheme.displayMedium!.copyWith(
                  fontSize: 22,
                ),
                underlineColor: AppColor.primary,
                cursorColor: AppColor.primary,
                onCompleted: (String value) {
                  setState(() {
                    code = value;
                  });
                },
                onEditing: (bool value) {
                  if (!value) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
            const VSpace.xl(),
            const Spacer(),
            const Text(
              'En signant, vous confirmez la transmission des déchets '
              'vers le transporteur.',
            ),
            const VSpace.md(),
            AppButton.primary(
              onPressed: () async {
                if (code != '1303') {
                  await showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Code invalide'),
                        content: const Text(
                          'Le code de vérification est incorrect.',
                        ),
                        actions: [
                          CupertinoButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

                await ref.read(signingServiceProvider).producerSigning(
                      signature,
                      producerPickUp.id,
                      latitude,
                      longitude,
                    );

                await context.pushNamed(
                  AppRoute.transporterSignature.name,
                  extra: producerPickUp,
                );
              },
              child: const Text('Signer'),
            ),
            const VSpace.xl(),
          ],
        ),
      ),
    );
  }
}

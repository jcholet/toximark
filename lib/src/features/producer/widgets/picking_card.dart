import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

class PickingCard extends StatelessWidget {
  const PickingCard({
    required this.producerPickUp,
    super.key,
  });

  final ProducerPickUp producerPickUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColor.grey,
          width: .3,
        ),
      ),
      width: double.infinity,
      height: 145,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  producerPickUp.description,
                  style: context.textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                const Text('Transporteur'),
              ],
            ),
            Text(
              producerPickUp.wasteCode.toString(),
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            const VSpace.sm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: PhosphorIcon(
                          PhosphorIconsDuotone.truck,
                          size: 22,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const HSpace.sm(),
                    Text(
                      '${producerPickUp.quantity} '
                      '${producerPickUp.unit}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const VSpace.sm(),
                Row(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: AppCorner.lgBorder,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: PhosphorIcon(
                          PhosphorIconsRegular.package,
                          size: 22,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const HSpace.sm(),
                    Text(
                      producerPickUp.packagingType,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const VSpace.lg(),
            const Spacer(),
            Text(
              '${DateFormat('dd MMM yyyy').format(producerPickUp.pickUpDate)} - '
              '${DateFormat('dd MMM yyyy').format(producerPickUp.dropOffDate)}',
            ),
          ],
        ),
      ),
    );
  }
}

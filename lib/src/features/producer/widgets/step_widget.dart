import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    required this.iconData,
    required this.description,
    this.isActive = false,
    super.key,
  });

  final IconData iconData;
  final String description;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColor.primary : Colors.white,
        borderRadius: const BorderRadius.all(
          AppCorner.lgRadius,
        ),
        border: isActive
            ? null
            : Border.all(
                color: AppColor.mediumGrey,
                width: .3,
              ),
      ),
      width: 80,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            PhosphorIcon(
              iconData,
              color: isActive ? AppColor.white : AppColor.mediumGrey,
            ),
            const VSpace.xs(),
            Text(
              description,
              style: context.textTheme.bodyMedium!.copyWith(
                color: isActive ? AppColor.white : AppColor.mediumGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

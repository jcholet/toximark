import 'package:flutter/material.dart';
import 'package:health_pitstop/src/utils/utils.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps * 2 - 1,
        (index) {
          if (index.isEven) {
            final dotIndex = index ~/ 2;
            return _StepDot(
              isCompleted: dotIndex < currentStep,
              isActive: dotIndex == currentStep,
            );
          } else {
            final segmentIndex = index ~/ 2;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 2,
                  color: segmentIndex < currentStep
                      ? AppColor.primary
                      : AppColor.primary.withValues(alpha: 0.2),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({
    required this.isCompleted,
    required this.isActive,
  });

  final bool isCompleted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final size = isActive ? 20.0 : 12.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isCompleted || isActive
            ? AppColor.primary
            : AppColor.primary.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColor.primary : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: isCompleted
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: size * 0.7,
            )
          : isActive
              ? Center(
                  child: Container(
                    width: size * 0.3,
                    height: size * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
    );
  }
}

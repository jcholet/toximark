import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_pitstop/src/features/onboarding/view/steps/success_step_controller.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SuccessStep extends ConsumerWidget {
  const SuccessStep({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(successStepControllerProvider);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.primary,
      child: Stack(
        children: [
          // Cercles animés en arrière-plan
          ...List.generate(
            5,
            (index) => Positioned.fill(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                      width: 2,
                    ),
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .scale(
                      begin: Offset.zero,
                      end: const Offset(4, 4),
                      duration: 3.seconds,
                      delay: (index * 600).milliseconds,
                    )
                    .fadeOut(
                      duration: 2.seconds,
                      delay: (index * 600).milliseconds,
                    ),
              ),
            ),
          ),
          // Logo principal
          Center(
            child: SvgPicture.asset(
              'lib/assets/img/24h-le-mans-new-logo.svg',
              height: 120,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )
                .animate()
                .scale(
                  begin: const Offset(0.5, 0.5),
                  end: const Offset(1, 1),
                  duration: 800.milliseconds,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(
                  duration: 400.milliseconds,
                )
                .then()
                .shimmer(
                  delay: 1000.ms,
                  duration: 6000.ms,
                  color: Colors.grey.shade400,
                  angle: 0.5,
                  size: 0.9,
                ),
          ),
          // Texte de félicitations
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Health Pitstop',
                  style: context.textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 1.seconds, duration: 800.milliseconds)
                    .slideY(
                      begin: 0.5,
                      end: 0,
                      delay: 1.seconds,
                      duration: 800.milliseconds,
                      curve: Curves.elasticOut,
                    )
                    .then()
                    .shimmer(
                      duration: 5000.ms,
                      color: Colors.grey.shade400,
                      angle: 0.5,
                      size: 0.9,
                    ),
                const VSpace.lg(),
                Text(
                  'Votre nouvel expérience pour les 24 heures du Mans !',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 1.2.seconds, duration: 500.milliseconds)
                    .slideY(
                      begin: 0.2,
                      end: 0,
                      delay: 1.2.seconds,
                      duration: 500.milliseconds,
                      curve: Curves.easeOutBack,
                    ),
              ],
            ),
          ),
        ],
      ),
    ).animate().callback(
          duration: 3500.ms,
          callback: (_) =>
              ref.read(successStepControllerProvider.notifier).refreshSession(),
        );
  }
}

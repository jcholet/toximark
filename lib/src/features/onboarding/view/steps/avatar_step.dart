import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/features/onboarding/view/widgets/avatar_picker.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';

class AvatarStep extends StatefulWidget {
  const AvatarStep({
    required this.onNextPressed,
    required this.initials,
    super.key,
  });

  final void Function(File?) onNextPressed;
  final String initials;

  @override
  State<AvatarStep> createState() => _AvatarStepState();
}

class _AvatarStepState extends State<AvatarStep>
    with AutomaticKeepAliveClientMixin {
  File? _avatar;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      maintainBottomViewPadding: true,
      child: ScrollableColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Votre photo de profil'.hardcoded,
            style: context.textTheme.displayMedium?.copyWith(
              color: AppColor.primary,
            ),
          ).animate().fade(delay: 100.ms),
          const VSpace.sm(),
          Text(
            'Utilisez une photo de profil pour que les autres utilisateurs '
                    'puissent vous reconnaître.'
                .hardcoded,
            style: context.textTheme.bodyLarge,
          ).animate().fade(delay: 100.ms),
          const VSpace.xl(),
          const Spacer(),
          AvatarPicker(
            onChanged: (avatar) => setState(() => _avatar = avatar),
            initials: widget.initials,
          ).animate().fade(delay: AppTime.medium).scale(
                delay: AppTime.medium,
                duration: AppTime.medium,
                curve: Curves.easeOutBack,
              ),
          const Spacer(),
          const VSpace.xl(),
          FadeInUp(
            duration: AppTime.slow,
            delay: AppTime.fast,
            curve: Curves.easeInOutBack,
            child: AppButton.primary(
              onPressed: () => widget.onNextPressed(_avatar),
              child: Text(
                _avatar == null ? 'Plus tard'.hardcoded : 'Continuer'.hardcoded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

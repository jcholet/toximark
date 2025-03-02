import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_pitstop/src/features/onboarding/view/widgets/avatar_picker_controller.dart';
import 'package:health_pitstop/src/features/profile/view/widgets/user_avatar.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AvatarPicker extends ConsumerWidget {
  const AvatarPicker({
    required this.onChanged,
    required this.initials,
    super.key,
  });

  final void Function(File?) onChanged;
  final String initials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(avatarPickerControllerProvider, (_, state) {
      onChanged(state.value);
    });

    final state = ref.watch(avatarPickerControllerProvider);
    return GestureDetector(
      onTap: !state.isLoading
          ? ref.read(avatarPickerControllerProvider.notifier).pickImage
          : null,
      child: Center(
        child: Stack(
          children: [
            UserAvatar(
              initials: initials,
              radius: 90,
              imageFile: state.value,
            ),
            Positioned(
              bottom: AppSpacing.xs,
              right: AppSpacing.xs,
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.white,
                    width: 6,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

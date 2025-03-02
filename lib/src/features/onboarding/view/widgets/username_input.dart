import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UsernameInput extends ConsumerWidget {
  const UsernameInput({
    required this.controller,
    required this.onChanged,
    required this.validator,
    this.focusNode,
    this.readOnly = false,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      titleText: "Nom d'utilisateur".hardcoded,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      textInputAction: TextInputAction.done,
      autofocus: true,
      autocorrect: false,
      readOnly: readOnly,
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: PhosphorIcon(
          PhosphorIconsRegular.at,
          size: 24,
        ),
      ),
    );
  }
}

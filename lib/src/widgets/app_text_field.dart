import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

/// {@template app_text_field}
/// A text field component based on material [TextFormField] widget with a
/// fixed, left-aligned label text displayed above the text field.
/// {@endtemplate}
class AppTextField extends StatelessWidget {
  /// {@macro app_text_field}
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.initialValue,
    this.titleText,
    this.hintText,
    this.autoFillHints,
    this.obscureText = false,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.autofocus = false,
    this.autocorrect = true,
    this.autovalidateMode,
    this.validator,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixText,
    this.suffixIcon,
    this.enabled = true,
    this.keyboardType,
    this.textCapitalization,
  }) : assert(
          !(suffixText != null && suffixIcon != null),
          'Declaring both suffixText and suffixIcon is not supported.',
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits editable content (e.g., user presses the
  /// "done" button on the keyboard).
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Called when the text field has been tapped outside.
  final void Function(PointerDownEvent)? onTapOutside;

  /// A value to initialize the field to.
  final String? initialValue;

  /// The text to display as the label for the text field.
  final String? titleText;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Whether to obscure the text being edited.
  final bool obscureText;

  /// The minimum number of lines the text field can have.
  final int? minLines;

  /// The maximum number of lines the text field can have.
  final int? maxLines;

  /// The maximum number of characters that the user can write.
  final int? maxLength;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// Whether to enable autocorrect.
  /// Defaults to true.
  final bool autocorrect;

  /// Whether this text field should focus itself if nothing else is already
  /// focused.
  /// Defaults to false.
  final bool autofocus;

  /// How the text field should autovalidate.
  final AutovalidateMode? autovalidateMode;

  /// An optional method to call with the final value when the form is
  /// submitted.
  final String? Function(String?)? validator;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool readOnly;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefixIcon;

  /// A text that appears after the editable part of the text field.
  final String? suffixText;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffixIcon;

  /// If false `helperText`, `errorText`, and `counterText` are not displayed,
  /// and the opacity of the remaining visual elements is reduced.
  final bool enabled;

  /// The type of keyboard to use for editing the text.
  /// Defaults to [TextInputType.text] if maxLines is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...[
          Text(
            titleText!,
            style: context.textTheme.bodyMedium,
          ),
          const VSpace.sm(),
        ],
        TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          onTapOutside: onTapOutside,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          autocorrect: autocorrect,
          autofocus: autofocus,
          autovalidateMode: autovalidateMode,
          validator: validator,
          readOnly: readOnly,
          autofillHints: autoFillHints,
          obscureText: obscureText,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          cursorColor: AppColor.dark,
          style: context.textTheme.bodyMedium?.copyWith(color: AppColor.dark),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: AppColor.mediumGrey,
            ),
            errorMaxLines: 4,
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints.tightFor(width: 48),
            suffixText: suffixText,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints.tightFor(width: 48),
            enabled: enabled,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton._({
    required this.child,
    this.onPressed,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    BorderSide? borderSide,
    double? elevation,
    TextStyle? textStyle,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
    super.key,
  })  : _buttonColor = buttonColor ?? AppColor.white,
        _disabledButtonColor = disabledButtonColor ?? AppColor.pastelGrey,
        _borderSide = borderSide,
        _foregroundColor = foregroundColor ?? AppColor.dark,
        _disabledForegroundColor =
            disabledForegroundColor ?? AppColor.mediumGrey,
        _elevation = elevation ?? 0,
        _textStyle = textStyle,
        _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _padding = padding ?? _defaultPadding;

  /// Filled dark button.
  const AppButton.dark({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.dark,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          textStyle: textStyle,
        );

  /// Filled black button.
  const AppButton.black({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.black,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          textStyle: textStyle,
        );

  /// Filled primary button.
  const AppButton.primary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.primary,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          textStyle: textStyle,
        );

  /// Filled red button.
  const AppButton.red({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.red,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          textStyle: textStyle,
        );

  /// Filled secondary button.
  // ? This button is not yet used in the app.
  const AppButton.secondary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Color? disabledButtonColor,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.primary,
          child: child,
          foregroundColor: AppColor.white,
          disabledButtonColor: disabledButtonColor ?? AppColor.mediumGrey,
          elevation: elevation,
          textStyle: textStyle,
          padding: _smallPadding,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
        );

  /// Outlined primary button.
  const AppButton.outlinedPrimary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          child: child,
          buttonColor: AppColor.white,
          borderSide: const BorderSide(color: AppColor.primary),
          elevation: elevation,
          foregroundColor: AppColor.primary,
          textStyle: textStyle,
        );

  /// Outlined light button.
  const AppButton.outlinedLight({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          child: child,
          buttonColor: AppColor.white,
          borderSide: const BorderSide(color: AppColor.pastelGrey),
          elevation: elevation,
          foregroundColor: AppColor.mediumGrey,
          textStyle: textStyle,
        );

  /// Outlined transparent light button.
  AppButton.outlinedTransparentLight({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          child: child,
          buttonColor: AppColor.transparent,
          disabledButtonColor: AppColor.transparent,
          borderSide: BorderSide(
            color: onPressed != null
                ? AppColor.white
                : AppColor.white.withValues(alpha: .5),
          ),
          elevation: elevation,
          foregroundColor: AppColor.white,
          disabledForegroundColor: AppColor.white.withValues(alpha: .5),
          textStyle: textStyle,
        );

  /// Outlined small primary button.
  const AppButton.outlinedSmallPrimary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          child: child,
          buttonColor: AppColor.white,
          borderSide: const BorderSide(color: AppColor.primary),
          elevation: elevation,
          foregroundColor: AppColor.primary,
          textStyle: textStyle,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled transparent light button.
  const AppButton.transparentLight({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          child: child,
          buttonColor: AppColor.transparent,
          disabledButtonColor: AppColor.transparent,
          elevation: elevation,
          foregroundColor: AppColor.white,
          disabledForegroundColor: AppColor.white,
          textStyle: textStyle,
          padding: _smallPadding,
        );

  /// Filled small transparent dark button.
  const AppButton.smallTransparentDark({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.dark,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled small transparent red button.
  const AppButton.smallTransparentRed({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.red,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled small red button.
  const AppButton.smallRed({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.red,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled small primary button.
  const AppButton.smallPrimary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.primary,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled small transparent button.
  const AppButton.smallTransparent({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          disabledButtonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.primary,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled small light transparent button.
  const AppButton.smallTransparentLight({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          disabledButtonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.white,
          elevation: elevation,
          maximumSize: _smallMaximumSize,
          minimumSize: _smallMinimumSize,
          padding: _smallPadding,
        );

  /// Filled tiny transparent primary button.
  const AppButton.tinyTransparent({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.primary,
          elevation: elevation,
          maximumSize: _tinyMaximumSize,
          minimumSize: _tinyMinimumSize,
          padding: _tinyPadding,
          textStyle: textStyle,
        );

  /// Filled tiny transparent red button.
  const AppButton.tinyTransparentRed({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.red,
          elevation: elevation,
          maximumSize: _tinyMaximumSize,
          minimumSize: _tinyMinimumSize,
          padding: _tinyPadding,
        );

  /// Filled tiny transparent grey button.
  const AppButton.tinyTransparentGrey({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
    double? elevation,
  }) : this._(
          key: key,
          onPressed: onPressed,
          buttonColor: AppColor.transparent,
          disabledButtonColor: AppColor.transparent,
          child: child,
          foregroundColor: AppColor.mediumGrey,
          elevation: elevation,
          maximumSize: _tinyMaximumSize,
          minimumSize: _tinyMinimumSize,
          padding: _tinyPadding,
        );

  /// The maximum size of the tiny variant of the button.
  static const _tinyMaximumSize = Size(double.infinity, 40);

  /// The minimum size of the tiny variant of the button.
  static const _tinyMinimumSize = Size(0, 40);

  /// The maximum size of the small variant of the button.
  static const _smallMaximumSize = Size(double.infinity, 40);

  /// The minimum size of the small variant of the button.
  static const _smallMinimumSize = Size(0, 40);

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// The padding of the tiny variant of the button.
  static const _tinyPadding = EdgeInsets.symmetric(horizontal: AppSpacing.md);

  /// The padding of the small variant of the button.
  static const _smallPadding = EdgeInsets.symmetric(horizontal: AppSpacing.xl);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: AppSpacing.lg);

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;

  /// A background color of the button.
  ///
  /// Defaults to [AppColor.white].
  final Color _buttonColor;

  /// A disabled background color of the button.
  ///
  /// Defaults to [AppColor.pastelGrey].
  final Color? _disabledButtonColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [AppColor.dark].
  final Color _foregroundColor;

  /// Color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColor.mediumGrey].
  final Color _disabledForegroundColor;

  /// A border of the button.
  final BorderSide? _borderSide;

  /// Elevation of the button.
  final double _elevation;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? _textStyle;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets _padding;

  /// [Widget] displayed on the button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textStyle = _textStyle ?? context.textTheme.labelLarge;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        maximumSize: WidgetStateProperty.all(_maximumSize),
        padding: WidgetStateProperty.all(_padding),
        minimumSize: WidgetStateProperty.all(_minimumSize),
        textStyle: WidgetStateProperty.all(textStyle),
        backgroundColor: onPressed == null
            ? WidgetStateProperty.all(_disabledButtonColor)
            : WidgetStateProperty.all(_buttonColor),
        elevation: WidgetStateProperty.all(_elevation),
        foregroundColor: onPressed == null
            ? WidgetStateProperty.all(_disabledForegroundColor)
            : WidgetStateProperty.all(_foregroundColor),
        overlayColor:
            WidgetStateProperty.all(_foregroundColor.withValues(alpha: .1)),
        /*
        overlayColor: _borderSide != null
            ? MaterialStateProperty.all(_borderSide?.color.withOpacity(.24))
            : null,
            */
        side: WidgetStateProperty.all(_borderSide),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(borderRadius: AppCorner.lgBorder),
        ),
      ),
      child: child,
    );
  }
}

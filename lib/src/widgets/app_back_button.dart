import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

/// {@template app_back_button}
/// A back button for the app.
/// {@endtemplate}
class AppBackButton extends StatelessWidget {
  /// {@macro app_back_button}
  const AppBackButton({
    super.key,
    this.onPressed,
    this.color,
    this.animate = false,
  });

  /// The callback that is called when the button is tapped
  /// or otherwise activated.
  ///
  /// If this is set to null, the button will do a default action
  /// when it is tapped or activated.
  final VoidCallback? onPressed;

  /// The color to use for the icon.
  final Color? color;

  /// Whether to animate the icon.
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? context.pop,
      icon: PhosphorIcon(
        PhosphorIconsBold.arrowLeft,
        color: color,
      ).animate(value: animate ? 0 : 1).scale(
            delay: AppTime.medium,
            duration: AppTime.fast,
            curve: Curves.easeOutBack,
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

/// {@template app_progress_indicator}
/// A custom progress indicator widget tailored for the application's design.
///
/// The `AppProgressIndicator` provides a standardized visual indication
/// of background processing across the app.
///
/// The primary color of the indicator can be overridden by supplying
/// the `color` parameter. By default, it uses the primary color from
/// `AppColor`.
///
/// Usage:
/// ```dart
/// AppProgressIndicator(
///   color: Colors.red,
/// )
/// ```
/// {@endtemplate}
class AppProgressIndicator extends StatelessWidget {
  /// {@macro app_progress_indicator}
  const AppProgressIndicator({
    this.color = AppColor.primary,
    this.radius = 20,
    super.key,
  });

  /// The color of the progress indicator. Defaults to `AppColor.primary`.
  final Color color;

  /// The radius of the progress indicator. Defaults to `20`.
  final double radius;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: color,
      secondRingColor: color.withValues(alpha: .3),
      thirdRingColor: AppColor.transparent,
      size: radius,
    );
    // return SizedBox.square(
    //   dimension: radius,
    //   child: CircularProgressIndicator(
    //     color: color,
    //     strokeWidth: strokeWidth,
    //   ),
    // );
  }
}

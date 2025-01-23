import 'package:flutter/widgets.dart';

/// Provides standardized corner radius values and their corresponding
/// `BorderRadius` and `Radius` objects for consistent UI design across the
/// application.
abstract class AppCorner {
  /// A small corner radius value of `3` pixels.
  static const double sm = 3;

  /// A `BorderRadius` object with small corner radius for all corners.
  /// Suitable for subtle rounding effects in UI elements.
  static const BorderRadius smBorder = BorderRadius.all(smRadius);

  /// A `Radius` object with a small corner radius value.
  /// Provides a more direct way to apply a corner rounding without the need for
  /// a `BorderRadius`.
  static const Radius smRadius = Radius.circular(sm);

  /// A medium corner radius value of `6` pixels.
  static const double md = 6;

  /// A `BorderRadius` object with medium corner radius for all corners.
  /// Suitable for moderately rounded effects in UI elements.
  static const BorderRadius mdBorder = BorderRadius.all(mdRadius);

  /// A `Radius` object with a medium corner radius value.
  /// Can be used for specific customization needs that only require the
  /// `Radius`.
  static const Radius mdRadius = Radius.circular(md);

  /// A large corner radius value of `10` pixels.
  static const double lg = 10;

  /// A `BorderRadius` object with large corner radius for all corners.
  /// Suitable for creating UI elements with a pronounced rounding effect.
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);

  /// A `Radius` object with a large corner radius value.
  /// Ideal for situations where only the `Radius` value is needed for specific
  /// customization.
  static const Radius lgRadius = Radius.circular(lg);
}

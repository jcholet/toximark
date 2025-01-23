/// Represents the standardized spacings used throughout the app, ensuring a
/// consistent layout and visual rhythm. These spacings are derived from a base
/// unit, allowing for proportional scaling across different spacing needs.
abstract class AppSpacing {
  /// The foundational unit of spacing, which serves as a base
  /// to derive other standardized spacings.
  static const double spaceUnit = 16;

  /// Extra-extra-extra small spacing, equivalent to 1 logical pixel.
  /// This is the smallest standardized spacing in the palette.
  static const double xxxs = 0.0625 * spaceUnit;

  /// Extra-extra small spacing, equivalent to 2 logical pixels.
  static const double xxs = 0.125 * spaceUnit;

  /// Extra small spacing, equivalent to 4 logical pixels.
  /// Suitable for subtle separations between closely related UI elements.
  static const double xs = 0.25 * spaceUnit;

  /// Small spacing, equivalent to 8 logical pixels.
  /// Often used for padding within small components or between adjacent
  /// elements.
  static const double sm = 0.5 * spaceUnit;

  /// Medium spacing, equivalent to 12 logical pixels.
  /// This is a commonly used spacing for general-purpose padding and margins.
  static const double md = 0.75 * spaceUnit;

  /// Large spacing, equivalent to the base unit of 16 logical pixels.
  /// Ideal for larger gaps or more prominent padding.
  static const double lg = spaceUnit;

  /// Spacing value that sits between large and extra large, equivalent to 20
  /// logical pixels.
  static const double xlsm = 1.25 * spaceUnit;

  /// Extra large spacing, equivalent to 24 logical pixels.
  /// Suitable for more significant separations or to group related components.
  static const double xl = 1.5 * spaceUnit;

  /// Extra-extra large spacing, equivalent to 40 logical pixels.
  /// Used for broad separations or to create clear distinctions between
  /// sections.
  static const double xxl = 2.5 * spaceUnit;

  /// Extra-extra-extra large spacing, equivalent to 64 logical pixels.
  /// This is the largest standardized spacing, ideal for major layout
  /// divisions.
  static const double xxxl = 4 * spaceUnit;
}

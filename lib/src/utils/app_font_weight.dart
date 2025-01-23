import 'package:flutter/material.dart';

/// Represents a collection of [FontWeight] values to standardize font weights
/// throughout the app, ensuring a consistent visual appearance.
abstract class AppFontWeight {
  /// Represents the thickest stroke width, making the text appear
  /// darkest and most prominent.
  static const FontWeight black = FontWeight.w900;

  /// Represents a thick stroke width, typically used for headings or
  /// to emphasize certain text.
  static const FontWeight bold = FontWeight.w700;

  /// Represents a semi-bold stroke width, suitable for highlighting
  /// text that doesn't need to be as prominent as bold but more than regular.
  static const FontWeight semiBold = FontWeight.w600;

  /// Represents a medium stroke width, suitable for highlighting
  /// text that doesn't need to be as prominent as bold but more than regular.
  static const FontWeight medium = FontWeight.w500;

  /// Represents the default stroke width for normal body text.
  static const FontWeight regular = FontWeight.w400;

  /// Represents a lighter stroke width, suitable for secondary text
  /// that should not draw as much attention as the main content.
  static const FontWeight light = FontWeight.w300;

  /// Represents the thinnest stroke width, making the text appear
  /// very light. Suitable for subtle hints or secondary info.
  static const FontWeight thin = FontWeight.w100;
}

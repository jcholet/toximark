import 'package:flutter/material.dart';

/// Represents the standard color palette used across the UI Kit, ensuring
/// consistent and harmonized design.
abstract class AppColor {
  /// Represents a soft, off-white color with an RGB value of `#FDFBF7`.
  /// Ideal for surfaces or background elements that require a warmer tone
  /// than pure white.
  static const Color light = Color(0xFFFDFBF7);

  /// Represents a soft, black color with an RGB value of `#1E1E1D`.
  static const Color dark = Color(0xFF1E1E1D);

  /// Represents the color white with an RGB value of `#FFFFFF`.
  static const Color white = Color(0xFFFFFFFF);

  /// Represents the color black with an RGB value of `#000000`.
  static const Color black = Color(0xFF000000);

  /// Represents a slightly transparent variation of black with 54% opacity.
  /// Suitable for overlays or to give a hint of color without full coverage.
  static const Color black54 = Color(0x8A000000);

  /// Represents a lightly transparent variation of black with 25% opacity.
  /// Often used for subtle shadows, overlays, or subdued backgrounds.
  static const Color black25 = Color(0x40202124);

  /// The primary color of the app, characterized by a vibrant shade of blue
  /// with an RGB value of `#1871FB`. Often used for call-to-action buttons,
  /// active elements, or highlighting important content.
  static const Color primary = Color(0xFF20325C);

  /// Represents a lighter shade of grey with an RGB value of `#CCCCCC`.
  /// Suitable for more subdued or lighter backgrounds and elements.
  static const Color pastelGrey = Color(0xFFEDEDEE);

  /// Represents the color grey with an RGB value of `#C8C8C0`.
  /// Suitable for neutral backgrounds, texts, or inactive elements.
  static const Color grey = Color(0xFFC8C8C0);

  /// Represents a medium shade of grey with an RGB value of `#747474`.
  /// Suitable for neutral text or elements that require moderate emphasis.
  static const Color mediumGrey = Color(0xFF747474);

  /// Represents a dark shade of grey with an RGB value of `#333333`.
  /// Ideal for text or elements that require strong visual emphasis.
  static const Color strongGrey = Color(0xFF333333);

  /// Represents the focus color with an RGB value of `#F44336`.
  /// Suitable for emphasizing elements that are currently active or require
  /// attention.
  static const Color red = Color(0xFFF44336);

  /// Represents the warning color with an RGB value of `#FFC107`.
  /// Suitable for indicating warnings, errors, or elements that require
  /// caution.
  static const Color yellow = Color(0xFFFFC107);

  /// Represents the success color with an RGB value of `#4CAF50`.
  /// Suitable for indicating successful operations or positive outcomes.
  static const Color green = Color(0xFF4CAF50);

  /// Represents a fully transparent color. Useful for overlay or background
  /// elements that shouldn't cover or obscure other content.
  static const Color transparent = Color(0x00000000);
}

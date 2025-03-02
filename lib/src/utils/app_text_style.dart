import 'package:flutter/material.dart';
import 'package:health_pitstop/src/utils/utils.dart';

/// Represents a collection of standardized text styles for the app, ensuring a
/// consistent typography across different UI components.
///
/// The core text styles are defined here, and specific style variants can be
/// derived from these by using the `copyWith()` method.
abstract class AppTextStyle {
  /// Provides a predefined [TextTheme] object comprising of various text styles
  /// for common text components such as titles, headlines, and body text.
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );

  /// Base text style for the "Archivo" font family with default properties.
  static const _archivo = TextStyle(
    color: AppColor.dark,
    fontFamily: AppFont.archivo,
    fontWeight: AppFontWeight.regular,
  );

  /// Base text style for the "ClashDisplay"
  ///  font family with default properties.
  static const _clashDisplay = TextStyle(
    color: AppColor.dark,
    fontFamily: AppFont.clashDisplay,
    fontWeight: AppFontWeight.regular,
    height: 1,
  );

  /// Text style for large display text, typically used for prominent UI
  /// elements.
  static TextStyle get displayLarge => _clashDisplay.copyWith(
        fontSize: 32,
        fontWeight: AppFontWeight.bold,
      );

  /// Text style for medium display text.
  static TextStyle get displayMedium => _clashDisplay.copyWith(
        fontSize: 28,
        fontWeight: AppFontWeight.medium,
      );

  /// Text style for small display text.
  static TextStyle get displaySmall => _clashDisplay.copyWith(
        fontSize: 20,
        fontWeight: AppFontWeight.medium,
      );

  /// Text style for large headlines, suitable for article titles or section
  /// headers.
  static TextStyle get headlineLarge => _archivo.copyWith(
        fontSize: 28,
        fontWeight: AppFontWeight.semiBold,
        height: 1.2,
      );

  /// Text style for medium headlines.
  static TextStyle get headlineMedium => _archivo.copyWith(
        fontSize: 24,
        fontWeight: AppFontWeight.semiBold,
        height: 1.2,
      );

  /// Text style for small headlines, suitable for sub-headers or secondary
  /// titles.
  static TextStyle get headlineSmall => _archivo.copyWith(
        fontSize: 20,
        fontWeight: AppFontWeight.semiBold,
        height: 1.2,
      );

  /// Bold text style for large titles.
  static TextStyle get titleLarge => _archivo.copyWith(
        fontSize: 16,
        fontWeight: AppFontWeight.bold,
      );

  /// Bold text style for medium titles.
  static TextStyle get titleMedium => _archivo.copyWith(
        fontSize: 14,
        fontWeight: AppFontWeight.bold,
      );

  /// Bold text style for small titles.
  static TextStyle get titleSmall => _archivo.copyWith(
        fontSize: 12,
        fontWeight: AppFontWeight.bold,
      );

  /// Text style for large body content, suitable for main textual content.
  static TextStyle get bodyLarge => _archivo.copyWith(fontSize: 16);

  /// Text style for medium body content.
  static TextStyle get bodyMedium => _archivo.copyWith(fontSize: 14);

  /// Text style for small body content, suitable for secondary or less
  /// important text.
  static TextStyle get bodySmall => _archivo.copyWith(fontSize: 12);

  /// Text style for large labels, typically used for form field labels or UI
  /// component labels.
  static TextStyle get labelLarge => _archivo.copyWith(
        fontSize: 14,
        fontWeight: AppFontWeight.bold,
      );

  /// Text style for medium labels.
  static TextStyle get labelMedium => _archivo.copyWith(
        fontSize: 12,
        fontWeight: AppFontWeight.bold,
      );

  /// Text style for small labels, suitable for subtle hints or secondary
  /// labeling.
  static TextStyle get labelSmall => _archivo.copyWith(
        fontSize: 10,
        fontWeight: AppFontWeight.bold,
      );
}

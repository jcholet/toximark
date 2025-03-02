import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_pitstop/src/utils/utils.dart';

/// Use `context.textTheme` to access the [TextTheme] of the current [Theme].
extension TextThemeX on BuildContext {
  /// Returns the [ThemeData] from the current [Theme].
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] from the current [Theme].
  TextTheme get textTheme => theme.textTheme;
}

/// {@template app_theme}
/// Represents the app's theme configuration, encapsulating styles, colors,
/// and other visual properties to ensure consistent UI design.
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Provides the default `ThemeData` for the app, setting core visual
  /// properties like color schemes and text themes.
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: _colorScheme,
      textTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColor.dark,
        displayColor: AppColor.dark,
        decorationColor: AppColor.dark,
      ),
      primaryTextTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColor.white,
        displayColor: AppColor.white,
        decorationColor: AppColor.white,
      ),
      scaffoldBackgroundColor: AppColor.white,
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      dialogBackgroundColor: AppColor.white,
      appBarTheme: _appBarTheme,
      textButtonTheme: _textButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      dialogTheme: _dialogTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      snackBarTheme: _snackBarTheme,
      chipTheme: _chipTheme,
      listTileTheme: _listTileTheme,
      cardTheme: _cardTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primary,
      primaryContainer: _shift(AppColor.primary, .1),
      secondary: AppColor.primary,
      secondaryContainer: _shift(AppColor.primary, .1),
      surface: AppColor.white,
      onSurface: AppColor.dark,
      onError: AppColor.dark,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      error: AppColor.red,
    );
  }

  AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.primary,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.primary,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppCorner.mdBorder),
      ),
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        backgroundColor: AppColor.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        side: const BorderSide(color: AppColor.grey),
        shape: const RoundedRectangleBorder(borderRadius: AppCorner.mdBorder),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      prefixIconColor: AppColor.mediumGrey,
      suffixIconColor: AppColor.mediumGrey,
      fillColor: AppColor.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey),
        borderRadius: AppCorner.lgBorder,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey),
        borderRadius: AppCorner.lgBorder,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.red),
        borderRadius: AppCorner.lgBorder,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey),
        borderRadius: AppCorner.lgBorder,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.red,
          width: AppStroke.thick,
        ),
        borderRadius: AppCorner.lgBorder,
      ),
      contentPadding: EdgeInsets.all(AppSpacing.lg),
      border: UnderlineInputBorder(),
      filled: true,
      isDense: true,
    );
  }

  DialogTheme get _dialogTheme {
    return const DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: AppCorner.lgBorder),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: AppCorner.lgRadius),
      ),
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      indicator: const UnderlineTabIndicator(),
      labelStyle: AppTextStyle.bodyLarge
          .copyWith(fontSize: AppTextStyle.bodyLarge.fontSize! * 1.1),
      labelColor: AppColor.white,
      unselectedLabelStyle: AppTextStyle.bodyLarge
          .copyWith(fontSize: AppTextStyle.bodyLarge.fontSize! * 1.1),
      unselectedLabelColor: AppColor.white,
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColor.pastelGrey,
      thickness: AppStroke.thin,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return const SnackBarThemeData(
      backgroundColor: AppColor.red,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppCorner.mdBorder,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: AppColor.white,
      selectedColor: AppColor.white,
      labelStyle: AppTextStyle.bodyMedium,
      showCheckmark: false,
      elevation: 0,
      pressElevation: 0,
    );
  }

  ListTileThemeData get _listTileTheme {
    return ListTileThemeData(
      titleTextStyle: AppTextStyle.bodyLarge,
      titleAlignment: ListTileTitleAlignment.center,
      iconColor: AppColor.mediumGrey,
      horizontalTitleGap: 0,
    );
  }

  CardTheme get _cardTheme {
    return const CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(color: AppColor.grey),
      //   borderRadius: AppCorner.mdBorder,
      // ),
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColor.primary,
    );
  }

  /// This will add luminance in dark mode, and remove it in light.
  /// Allows the view to just make something "stronger" or "weaker" without
  /// worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1);
  //      -10% lum in dark mode, +10% in light mode
  static Color _shift(Color c, double amt) {
    // final a = amt * (isDark ? -1 : 1);
    // Convert to HSL.
    final hslc = HSLColor.fromColor(c);
    // Add/Remove lightness.
    final lightness = (hslc.lightness + amt).clamp(0, 1.0) as double;
    // Convert back to Color.
    return hslc.withLightness(lightness).toColor();
  }
}

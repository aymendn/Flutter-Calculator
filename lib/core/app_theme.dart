import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static const fontFamily = 'inter';

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    final onBg = colorScheme.onBackground;
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        titleTextStyle:
            _textTheme.headline4!.apply(fontFamily: fontFamily, color: onBg),
        elevation: 0,
      ),
      scaffoldBackgroundColor: colorScheme.bg,
      textTheme: TextTheme(
        headline1: TextStyle(fontWeight: _bold, fontSize: 48, color: onBg),
        headline2: TextStyle(fontWeight: _bold, fontSize: 38, color: onBg),
        headline3: TextStyle(fontWeight: _semiBold, fontSize: 32, color: onBg),
        headline4: TextStyle(fontWeight: _semiBold, fontSize: 24, color: onBg),
        headline5: TextStyle(fontWeight: _medium, fontSize: 20, color: onBg),
        headline6: TextStyle(fontWeight: _regular, fontSize: 18, color: onBg),
        //
        bodyText1: const TextStyle(fontWeight: _regular, fontSize: 16),
        bodyText2: const TextStyle(fontWeight: _bold, fontSize: 16),
        //
        caption: const TextStyle(fontWeight: _semiBold, fontSize: 16),
        button: const TextStyle(fontWeight: _bold, fontSize: 18),
        //
      ),
    );
  }

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primaryLight,
    primary: AppColor.primaryLight,
    secondary: AppColor.secondaryLight,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primaryDark,
    primary: AppColor.primaryDark,
    secondary: AppColor.secondaryDark,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontWeight: _bold, fontSize: 72),
    headline2: TextStyle(fontWeight: _bold, fontSize: 48),
    headline3: TextStyle(fontWeight: _semiBold, fontSize: 32),
    headline4: TextStyle(fontWeight: _semiBold, fontSize: 24),
    headline5: TextStyle(fontWeight: _medium, fontSize: 18),
    headline6: TextStyle(fontWeight: _regular, fontSize: 16),
    //
    subtitle1: TextStyle(fontWeight: _medium, fontSize: 16.0),
    subtitle2: TextStyle(fontWeight: _medium, fontSize: 14.0),
    //
    bodyText1: TextStyle(fontWeight: _regular, fontSize: 16),
    bodyText2: TextStyle(fontWeight: _medium, fontSize: 16),
    //
    caption: TextStyle(fontWeight: _semiBold, fontSize: 16),
    button: TextStyle(fontWeight: _semiBold, fontSize: 18.0),
  );
}

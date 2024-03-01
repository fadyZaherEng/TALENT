import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      fontFamily: getFontFamily(),
      toggleableActiveColor: ColorSchemes.primary,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ColorSchemes.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchemes.primary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchemes.gray,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.gray,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
            fontSize: 18,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w700),
        //semi bold
        bodyLarge: getTextStyle(
            fontSize: 16,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w700),
        //Regular
        titleSmall: getTextStyle(
          fontSize: 11,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
        ),
        //semi bold
        bodyMedium: getTextStyle(
            fontSize: 13,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w700),
        //medium
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
        ),
        //medium
        titleMedium: getTextStyle(
          fontSize: 14,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
        ),
        //Regular
        labelLarge: getTextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.normal), //Regular
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorSchemes.white,
        elevation: 8,
        selectedIconTheme: IconThemeData(
          color: ColorSchemes.primary,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: ColorSchemes.gray,
          size: 24,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorSchemes.primary,
      splashColor: Colors.transparent,
    );
  }

  String getFontFamily() => language == "en"
      ? Constants.englishFontFamily
      : Constants.arabicFontFamily;

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = Constants.englishFontFamily,
    Color color = ColorSchemes.primary,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color);
  }
}

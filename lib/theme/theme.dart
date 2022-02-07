import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    // accentColor: kAccentLightColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      secondary: kSecondaryLightColor,
      brightness: Brightness.dark,
    ),
    cardColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      fillColor: kAccentIconLightColor,
      // fillColor: kAccentLightColor,
    ),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: Colors.white,
    ),

    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: kBodyTextColorLight),
    primaryIconTheme: const IconThemeData(color: kBodyTextColorLight),
    textTheme: GoogleFonts.latoTextTheme(),
    // copyWith(
    // bodyText1: const TextStyle(color: kBodyTextColorLight),
    // bodyText2: const TextStyle(color: kBodyTextColorLight),
    // headline4: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
    // headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
    // ),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    backgroundColor: const Color(0xFF0D0C0E),
    cardColor: kSurfaceDarkColor,
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      fillColor: kSurfaceDarkColor,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorDark),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: Colors.grey[400]),
      headline4: TextStyle(color: Colors.grey[600], fontSize: 32),
      headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      subtitle1: const TextStyle(color: kBodyTextColorDark),
      headline6: TextStyle(color: Colors.grey[500]),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: kAccentDarkColor,
      surface: kSurfaceDarkColor,
      brightness: Brightness.light,
    ),
  );
}

AppBarTheme appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);

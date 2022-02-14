import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) {
  const iconThemeData = IconThemeData(color: kAccentIconDarkColor);
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
    primaryColor: kPrimaryColor,

    // accentColor: kAccentLightColor,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
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

    iconTheme: iconThemeData,
    primaryIconTheme: iconThemeData,
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
  const backgroundColor = Color(0xFF0D0C0E);
  // final iconTheme = ThemeData.dark().iconTheme.merge(IconThemeData(color: kAccentIconLightColor))
  const iconTheme = IconThemeData(color: kBodyTextColorDark);
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: appBarTheme,
    backgroundColor: backgroundColor,
    cardColor: kSurfaceDarkColor,
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      fillColor: kSurfaceDarkColor,
    ),
    iconTheme: iconTheme,
    primaryIconTheme: iconTheme,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: Colors.grey[400]),
      headline4: TextStyle(color: Colors.grey[600], fontSize: 32),
      headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      subtitle1: const TextStyle(color: kBodyTextColorDark),
      headline6: TextStyle(color: Colors.grey[300]),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: kAccentDarkColor,
      surface: kSurfaceDarkColor,
      brightness: Brightness.light,
    ),
  );
}

AppBarTheme appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData define() {
    final Color primary = Color(0xFF18396a);
    final Color primaryVariant = Color(0xFFb37a2e);
    final Color secondary = Color(0xFF18396a);
    final Color secondaryVariant = Color(0xFF97a7c2);

    final Color surface = Color(0xFFFFFFFF);
    final Color background = Color(0xFFf8f9fa);
    final Color error = Color(0xFFB00020);
    final Color onPrimary = Color(0xFFFFFFFF);
    final Color onSecondary = Color(0xFFFFFFFF);
    final Color onSurface = Color(0xDD000000);
    final Color onBackground = Color(0xDD000000);
    final Color onError = Color(0xFFFFFFFF);

    return ThemeData(
      colorScheme: ColorScheme(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onSurface: onSurface,
          onBackground: onBackground,
          onError: onError,
          brightness: Brightness.light),
      backgroundColor: background,
      primaryColor: primary,
      splashColor: primary.withOpacity(.1),
      focusColor: primary.withOpacity(.1),
      scaffoldBackgroundColor: background,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primary),
      appBarTheme: AppBarTheme(
        toolbarTextStyle: GoogleFonts.montserrat(
            color: onPrimary, fontSize: 23, fontWeight: FontWeight.w500),
        backgroundColor: secondary,
        // elevation: 0,
        iconTheme: IconThemeData(color: onPrimary),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(
          color: primary,
          fontSize: 30,
          fontWeight: FontWeight.normal,
        ),
        headline2: GoogleFonts.montserrat(
          color: primary,
          fontSize: 40,
          fontWeight: FontWeight.normal,
        ),
        headline3: GoogleFonts.montserrat(
          color: primary,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        headline4: GoogleFonts.montserrat(
          color: primary,
          fontSize: 30,
          fontWeight: FontWeight.normal,
        ),
        headline5: GoogleFonts.montserrat(
          color: primary,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        headline6: GoogleFonts.montserrat(
          color: primary,
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
        subtitle1: GoogleFonts.openSans(
          color: onBackground,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: GoogleFonts.openSans(
          color: onBackground,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: GoogleFonts.openSans(
          color: onBackground,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: GoogleFonts.openSans(
          color: onBackground,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        caption: GoogleFonts.openSans(
          color: onBackground,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        button: GoogleFonts.montserrat(
          color: onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        overline: GoogleFonts.openSans(
            color: onSurface,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5),
      ),
    );
  }
}

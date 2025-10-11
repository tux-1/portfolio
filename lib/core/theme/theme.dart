import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: GoogleFonts.robotoMonoTextTheme().apply(
        bodyColor: Colors.white.withAlpha((255 * 0.78).floor()),
        displayColor: Colors.white,
      ),
      brightness: Brightness.dark, // The original site has a dark theme
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF6EACDA),
        onSecondary: Colors.white.withAlpha(99),
      ),
      fontFamily: 'RobotoMono',
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.robotoMonoTextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      scaffoldBackgroundColor: Color(0xFFF5F5F0),
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: const Color.fromARGB(255, 12, 66, 92),
        onSecondary: Color(0xFF727272),
      ),
      fontFamily: 'RobotoMono',
    );
  }
}

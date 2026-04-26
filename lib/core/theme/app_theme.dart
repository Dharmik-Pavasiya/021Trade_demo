import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized theme configuration for the application.
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: GoogleFonts.interTextTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        primary: Colors.black,
        secondary: Colors.grey[600]!,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 0.5,
        space: 1,
      ),
    );
  }

  // Custom colors matching the UI
  static const Color priceGreen = Color(0xFF4CAF50);
  static const Color priceRed = Color(0xFFE53935);
  static const Color secondaryText = Color(0xFF757575);
}

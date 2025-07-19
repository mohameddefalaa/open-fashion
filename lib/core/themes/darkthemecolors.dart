import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';

class DarkthemeAppcolors {
  static Color titleActive = Color(0xff111111);
  static Color iconColore = Color(0xffF4F4F4);
}

ThemeData darktheme = ThemeData(
  scaffoldBackgroundColor: DarkthemeAppcolors.titleActive,
  iconTheme: IconThemeData(color: Lightthemcolors.sbbcolor),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.tenorSans(
      fontSize: 12,
      color: Color(0xffFCFCFC),
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    ),
    bodyLarge: GoogleFonts.tenorSans(
      letterSpacing: 4,
      fontSize: 18,
      color: Color(0xffFCFCFC),
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.tenorSans(
      letterSpacing: 0,
      fontSize: 14,
      color: Color(0xff555555),
      fontWeight: FontWeight.w400,
    ),
  ),
);

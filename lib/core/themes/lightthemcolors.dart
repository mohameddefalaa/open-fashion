import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';

class Lightthemcolors {
  static Color iconlightcolor = Color(0xff333333);
  static Color sbbcolor = Color(0xffFFFFFF);
}

ThemeData lighttheme = ThemeData(
  iconTheme: IconThemeData(color: Lightthemcolors.iconlightcolor),
  scaffoldBackgroundColor: Lightthemcolors.sbbcolor,
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.tenorSans(
      fontSize: 12,
      color: DarkthemeAppcolors.titleActive,
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    ),
    bodyLarge: GoogleFonts.tenorSans(
      letterSpacing: 4,
      fontSize: 18,
      color: DarkthemeAppcolors.titleActive,
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

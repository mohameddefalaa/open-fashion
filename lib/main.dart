import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DarkthemeAppcolors.titleActive,
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
      ),
      home: const Home(),
    );
  }
}

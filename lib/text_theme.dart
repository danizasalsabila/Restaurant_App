import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final TextTheme myfontsTextTheme = TextTheme(
  headline1: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3:
      GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.merriweather(
          fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.25)
      .apply(color: Color.fromARGB(255, 174, 68, 60)),
  headline5:
      GoogleFonts.merriweather(fontSize: 23, fontWeight: FontWeight.w800).apply(
    color: Color.fromARGB(255, 174, 68, 60),
  ),
  headline6: GoogleFonts.merriweather(
          fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 0.15)
      .apply(color: Colors.white),
  subtitle1: GoogleFonts.merriweather(
          fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.15)
      .apply(color: Colors.white),
  subtitle2: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.libreFranklin(
          fontSize: 12, fontWeight: FontWeight.w300, letterSpacing: 0.25)
      .apply(color: Color.fromARGB(255, 184, 184, 184)),
  button: GoogleFonts.libreFranklin(
          fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25)
      .apply(color: Colors.grey[600]),
  caption: GoogleFonts.libreFranklin(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

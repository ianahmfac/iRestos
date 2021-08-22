import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color accentColor = Color(0xFFFF9974);
const Color unselectedColor = Color(0xFFD9CFCD);
const Color bgColor = Color(0xFFF6F6F7);

TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.nunito(
      fontSize: 101, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.nunito(
      fontSize: 63, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.nunito(fontSize: 50, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.nunito(
      fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.nunito(fontSize: 25, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.nunito(
    fontSize: 21,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Colors.black,
  ),
  subtitle1: GoogleFonts.nunito(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.nunito(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.nunito(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.nunito(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.nunito(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.nunito(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.nunito(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

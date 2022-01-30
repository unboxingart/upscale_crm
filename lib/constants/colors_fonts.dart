import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Color themeBlack = const Color(0XFF5d576b);
Color themeGreen = const Color(0XFF99e1d9);
Color themeCream = const Color(0XFFfffae3);
Color themePink = const Color(0XFFf7567c);
Color themeWhite = const Color(0XFFfcfcfc);
Color themeYellow = const Color(0xFFF9DC5C);

TextStyle themeTitleTextStyleBig = GoogleFonts.signika(
    fontWeight: FontWeight.w700, fontSize: 26, color: themeBlack);

TextStyle themeTitleTextStyleBigWhite = GoogleFonts.signika(
    fontWeight: FontWeight.w700, fontSize: 38, color: themeWhite);

TextStyle themeSubtitleTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: themeWhite,
);

TextStyle splashScreenTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: themeWhite,
);

TextStyle themeSubtitleTextStyleSmall = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: themeWhite,
);

TextStyle themeTextStyleBlackMedium = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: themeBlack,
);

TextStyle themeSubtitleTextStyleBlack = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: themeBlack,
);

TextStyle themeSubtitleTextStyleStats = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: themeBlack,
);

TextStyle themeSubtitleTextStyleLoading = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: themeBlack,
);

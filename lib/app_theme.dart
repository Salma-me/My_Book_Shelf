import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_book_shelf/constants.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  ).copyWith(
    scaffoldBackgroundColor: kPrimaryColor,
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}
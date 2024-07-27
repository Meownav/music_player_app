import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color.fromRGBO(232, 234, 239, 1),
    primary: Color.fromRGBO(23, 28, 38, 1),
    secondary: Color.fromRGBO(108, 118, 137, 1),
    tertiary: Color.fromRGBO(164, 170, 183, 1),
  ),
  textTheme: GoogleFonts.geologicaTextTheme(),
);

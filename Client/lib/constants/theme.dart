import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define the app theme
const kPrimaryColor = Color(0xFF990D35); // Jasmine
const kScaffoldBackgroundColor = Color(0xFFFFFFFF); // White
const kCanvasColor = Color(0xFFFFF8E8); // Cosmic latte
const kTextColor = Color(0xFF000000); // Black for contrast
const kRustyRed = Color(0xFFD52941); // Rusty red
const kCosmicLatte = Color(0xFFFFF8E8); // Cosmic latte
const kSecondaryColor = Color(0xFFFCD581);
final kColorScheme =
    ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor);
// Define the app theme FONTS
final kHeadlineSmall = TextTheme(
  headlineSmall: GoogleFonts.playfairDisplay(
    textStyle: TextStyle(
      color: kTextColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
final kBodyLarge = TextTheme(
  bodyLarge: GoogleFonts.playfairDisplay(
    textStyle: TextStyle(color: kRustyRed),
  ),
);
final kBodyMedium = TextTheme(
  bodyMedium: GoogleFonts.playfairDisplay(
    textStyle: TextStyle(color: kTextColor),
  ),
);
final kFadeBodyMedium = TextTheme(
    bodyMedium: GoogleFonts.playfairDisplay(
  textStyle: TextStyle(color: kTextColor.withOpacity(0.5)),
));

final kDisplayMedium = TextTheme(
  displayMedium: GoogleFonts.playfairDisplay(
    textStyle: TextStyle(
      color: kCanvasColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
final kDisplayLarge = TextTheme(
  displayLarge: GoogleFonts.playfairDisplay(
    textStyle: TextStyle(
      color: kRustyRed,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  ),
);

// Define the app theme BUTTONS

final kButtonTheme = ButtonThemeData(
  buttonColor: kRustyRed,
  textTheme: ButtonTextTheme.accent,
);

// Define the app theme SHADOW
final kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 3), // changes position of shadow
);

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF990D35), // Jasmine
  scaffoldBackgroundColor: Color(0xFFFFFFFF), // White
  canvasColor: Color(0xFFFFF8E8), // Cosmic latte
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.playfairDisplay(
      textStyle: TextStyle(
        color: Color(0xFF000000), // Black for contrast
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    bodyLarge: GoogleFonts.playfairDisplay(
      textStyle: TextStyle(color: Color(0xFFD52941)), // Rusty red
    ),
    bodyMedium: GoogleFonts.playfairDisplay(
      textStyle: TextStyle(color: Color(0xFF000000)), // Black for contrast
    ),
    displayLarge: GoogleFonts.playfairDisplay(
      textStyle: TextStyle(
        color: Color(0xFFD52941), // Rusty red
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Define other text styles as needed
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFD52941), // Rusty red
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFCD581)),
  // You can add more theme customizations here
);

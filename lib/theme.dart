import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextTheme textTheme = TextTheme(
      displayLarge: GoogleFonts.nunito(
        fontSize: 30,
        fontWeight: FontWeight.w600
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.nunito(
        fontSize: 16,
      ),
      labelMedium: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.bold
      ),
      labelSmall: GoogleFonts.nunito(
        fontSize: 16,
        color: Colors.grey.shade600
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 20
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 24
      ),
      headlineLarge: GoogleFonts.nunito(
        fontSize: 35,
        fontWeight: FontWeight.bold
      )
    );
ThemeData lightMode = ThemeData(

  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primaryContainer: Colors.grey.shade300,
    secondaryContainer: Colors.grey.shade600,
    primary: Colors.purple.shade100,
    inversePrimary: Colors.purple.shade400,
    inverseSurface: Colors.black,
    
    ),
    textTheme: textTheme,
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: const Color.fromARGB(255, 91, 0, 176),
    primaryContainer: Colors.grey.shade800,
    secondaryContainer: const Color.fromARGB(255, 118, 118, 118),
    tertiaryContainer: const Color.fromARGB(255, 106, 106, 106),
    inversePrimary: const Color.fromARGB(255, 194, 163, 236),
    inverseSurface: Colors.white,
    
    
  ),
  textTheme: textTheme,
);


class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }


  void toggle() {
    if (_themeData == lightMode){
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/colors/colors.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: forestGreen,
    scaffoldBackgroundColor: white,
    appBarTheme: _appBarTheme(forestGreen, white),
    iconTheme: const IconThemeData(color: forestGreen),
    textTheme: _lightTextTheme(),
    buttonTheme: _buttonTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(white, forestGreen, grey),
    cardTheme: _cardTheme(white, Colors.black12),
    checkboxTheme: _checkboxTheme(forestGreen, white),
    switchTheme: _switchTheme(forestGreen),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: forestGreen),
    sliderTheme: _sliderTheme(),
    colorScheme: _lightColorScheme(),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: forestGreen,
    scaffoldBackgroundColor: black,
    appBarTheme: _appBarTheme(black, forestGreen),
    iconTheme: const IconThemeData(color: white),
    textTheme: _darkTextTheme(),
    buttonTheme: _buttonTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(black54, forestGreen, grey),
    cardTheme: _cardTheme(black, black87),
    checkboxTheme: _checkboxTheme(forestGreen, white),
    switchTheme: _switchTheme(forestGreen),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: forestGreen),
    sliderTheme: _sliderTheme(),
    colorScheme: _darkColorScheme(),
  );

  // Define AppBarTheme
  static AppBarTheme _appBarTheme(Color backgroundColor, Color iconColor) {
    return AppBarTheme(
      color: backgroundColor,
      iconTheme: IconThemeData(color: iconColor),
      titleTextStyle: TextStyle(
          color: iconColor, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  // Define TextTheme for light mode
  static TextTheme _lightTextTheme() {
    return const TextTheme(
      displayLarge:
          TextStyle(color: black, fontSize: 24, fontWeight: FontWeight.bold),
      displayMedium:
          TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: black, fontSize: 16),
      bodyMedium: TextStyle(color: black54, fontSize: 14),
      labelLarge:
          TextStyle(color: white, fontWeight: FontWeight.bold), // for buttons
      titleMedium: TextStyle(color: black87, fontSize: 16),
    );
  }

  // Define TextTheme for dark mode
  static TextTheme _darkTextTheme() {
    return const TextTheme(
      displayLarge:
          TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
      displayMedium:
          TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: white70, fontSize: 16),
      bodyMedium: TextStyle(color: white54, fontSize: 14),
      labelLarge:
          TextStyle(color: white, fontWeight: FontWeight.bold), // for buttons
      titleMedium: TextStyle(color: white70, fontSize: 16),
    );
  }

  // Define ButtonThemeData
  static ButtonThemeData _buttonTheme() {
    return const ButtonThemeData(
      buttonColor: forestGreen, // Background color for buttons
      textTheme:
          ButtonTextTheme.primary, // Ensures the button text color is white
    );
  }

  // Define ElevatedButtonThemeData
  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: white, // Text color
        backgroundColor: forestGreen, // Button color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Define OutlinedButtonThemeData
  static OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: forestGreen,
        side: const BorderSide(color: forestGreen, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Define TextButtonThemeData
  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: forestGreen, // Text color
      ),
    );
  }

  // Define FloatingActionButtonThemeData
  static FloatingActionButtonThemeData _floatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: forestGreen,
      foregroundColor: white,
    );
  }

  // Define InputDecorationTheme
  static InputDecorationTheme _inputDecorationTheme(
      Color fillColor, Color focusColor, Color borderColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: focusColor)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    );
  }

  // Define CardTheme
  static CardTheme _cardTheme(Color cardColor, Color shadowColor) {
    return CardTheme(
      color: cardColor,
      shadowColor: shadowColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  // Define CheckboxThemeData
  static CheckboxThemeData _checkboxTheme(Color fillColor, Color checkColor) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.all(fillColor),
      checkColor: WidgetStateProperty.all(checkColor),
    );
  }

  // Define SwitchThemeData
  static SwitchThemeData _switchTheme(Color thumbColor) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.all(thumbColor),
      trackColor: WidgetStateProperty.all(thumbColor.withOpacity(0.5)),
    );
  }

  // Define SliderThemeData
  static SliderThemeData _sliderTheme() {
    return const SliderThemeData(
      activeTrackColor: forestGreen,
      thumbColor: forestGreen,
    );
  }

  // Define light ColorScheme
  static ColorScheme _lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: forestGreen,
      onPrimary: white,
      secondary: greenAccent,
      onSecondary: white,
      error: red,
      onError: white,
      surface: white,
      onSurface: black,
    );
  }

  // Define dark ColorScheme
  static ColorScheme _darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: forestGreen,
      onPrimary: black,
      secondary: greenAccent,
      onSecondary: black,
      error: red,
      onError: black,
      surface: black,
      onSurface: white,
    );
  }
}

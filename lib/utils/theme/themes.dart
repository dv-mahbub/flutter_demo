import 'package:flutter/material.dart';

/// A class to control the application theme (light or dark).
class ThemeController {
  /// The current theme mode of the application.
  ThemeMode themeMode = ThemeMode.light;

  /// Switches the theme mode between light and dark.
  void switchThemeMode() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  /// The light theme data for the application.
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
    ),
    hintColor: Colors.grey,
    primaryColor: Colors.blue[800],
    scaffoldBackgroundColor: const Color(0xFFECEFF1),
  );

  /// The dark theme data for the application.
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.5),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(brightness: Brightness.dark),
  );
}

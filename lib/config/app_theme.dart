import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/constant.dart';

enum AppTheme { light, dark }

const _primaryColor = Color(0xFF206A5D);
const _secondaryColor = Color(0xFFBFDCAE);
const _lightBgColor = Color(0xFFF1F1E8);
const _lightTextColor = Color(0xFF09183F);
const _lightTextsecondaryColor = Color(0xFF2C3333);
final _lightErrorColor = Colors.red.shade700;
final _borderRadiusCard = BorderRadius.circular(20);
final _borderRadiusButton = BorderRadius.circular(12);

final _lightTextInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide(
    color: _lightTextColor.withOpacity(0.1),
    width: 1,
  ),
);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: _primaryColor,
      unselectedItemColor: _lightTextColor.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 20),
      unselectedIconTheme: const IconThemeData(size: 20),
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadiusCard,
      ),
    ),
    fontFamily: FontFamily.avenir,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: _lightTextColor,
      ),
      bodyMedium: TextStyle(
        color: _lightTextsecondaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return _lightTextColor.withOpacity(0.15);
          }
          return _primaryColor;
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: _borderRadiusButton,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: _borderRadiusButton,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: _borderRadiusButton,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: _lightTextInputBorder,
      border: _lightTextInputBorder,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightErrorColor),
        borderRadius: BorderRadius.circular(12),
      ),
      errorStyle: TextStyle(
        color: _lightErrorColor,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadiusCard,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadiusCard,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,
      background: _lightBgColor,
    ).copyWith(error: _lightErrorColor),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColor,
      secondary: _secondaryColor,
    ),
  ),
};

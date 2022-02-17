import 'package:flutter/material.dart';

class ColorMap {
  factory ColorMap() {
    return _instance;
  }

  ColorMap._internal() {
    debugPrint("Color Map Class Created");
  }
  static final ColorMap _instance = ColorMap._internal();
  static const int _primaryValue = 0xFF29A19C;

  static const MaterialColor _primaryScale = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFD6EFD2),
      100: Color(0xFFAFE1B2),
      200: Color(0xFF8CD2A0),
      300: Color(0xFF6AC297),
      400: Color(0xFF49B296),
      500: Color(_primaryValue),
      600: Color(0xFF1D938F),
      700: Color(0xFF14847F),
      800: Color(0xFF0C736E),
      900: Color(0xFF06605C),
    },
  );

  Color get black => const Color.fromRGBO(40, 40, 70, 1);
  Color get gray => const Color.fromRGBO(206, 206, 206, 1);

  MaterialColor get primary => _primaryScale;
}

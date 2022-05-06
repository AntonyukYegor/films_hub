import 'package:flutter/material.dart';

class CustomColors implements Colors {
  static const MaterialColor darkBlack = MaterialColor(
    _darkBlackPrimaryValue,
    <int, Color>{
      50: Color(0x00000000),
      100: Color(0x05050505),
      200: Color(0x10101010),
      300: Color(0xA0A0A0A0),
      400: Color(0xB0B0B0B0),
      500: Color(_darkBlackPrimaryValue),
      600: Color(0xC0C0C0C0),
      700: Color(0xD0D0D0D0),
      800: Color(0xF0F0F0F0),
      900: Color(0xFFFFFFFF),
    },
  );

  static const int _darkBlackPrimaryValue = 0xA0FFFFfF;
}
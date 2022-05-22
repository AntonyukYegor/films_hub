import 'package:flutter/material.dart';

extension ThemeModeToString on ThemeMode {
  String asString() {
    switch(this){
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }
}


extension StringToThemeMode on String {
  ThemeMode asThemeMode() {
    switch(this){
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }
}
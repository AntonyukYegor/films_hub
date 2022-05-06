import 'package:flutter/material.dart';

class NavigationTab {
  const NavigationTab({
    required this.icon,
    required this.page,
    required this.label,
  });

  final Icon icon;
  final String label;
  final Widget page;

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}

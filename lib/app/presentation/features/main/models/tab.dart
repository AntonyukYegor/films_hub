import 'package:flutter/material.dart';

class NavigationTab {
  const NavigationTab({
    required this.icon,
    required this.page,
    required this.onGenerateLabel,
  });

  final String Function() onGenerateLabel;

  final Icon icon;
  final Widget page;

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(icon: icon, label: onGenerateLabel.call());
  }
}

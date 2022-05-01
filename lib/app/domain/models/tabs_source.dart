import 'package:films_hub/app/domain/models/tab.dart';
import 'package:flutter/material.dart';

abstract class TabsSource {
  const TabsSource();

  int get count;

  List<NavigationTab> get tabs;

  Widget pageAt(int index);
}

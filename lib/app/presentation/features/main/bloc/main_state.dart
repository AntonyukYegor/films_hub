import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/tabs_source.dart';
import 'package:flutter/cupertino.dart';

class MainState extends Equatable {
  final int selectedIndex;

  final TabsSource _tabsSource;

  List<BottomNavigationBarItem> get navigationBarItems =>
      _tabsSource.tabs.map((e) => e.toBottomNavigationBarItem()).toList();

  Widget get currentPage => _tabsSource.pageAt(selectedIndex);

  const MainState({required this.selectedIndex, required TabsSource tabsSource})
      : _tabsSource = tabsSource;

  MainState copyWith({int? selectedIndex, TabsSource? tabsSource}) => MainState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        tabsSource: _tabsSource,
      );

  @override
  List<Object> get props => [selectedIndex];
}

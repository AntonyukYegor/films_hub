import 'package:films_hub/app/domain/models/tabs_source.dart';
import 'package:films_hub/app/presentation/common/widgets/blur/symmetrical_blur.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final TabsSource _tabsSource;

  static const String navigationPath = '/';

  const MainPage(
    this._tabsSource, {
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Scaffold(body: widget._tabsSource.pageAt(_selectedIndex)),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                  width: 5.0,
                                  color: Theme.of(context).primaryColor),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.3),
                            ),
                          ),
                          const SymmetricalBlur.frost(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              border: Border.all(
                                width: 2.0,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    selectedItemColor:
                        Theme.of(context).textTheme.titleSmall?.color,
                    unselectedItemColor: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.color
                        ?.withOpacity(0.4),
                    items: widget._tabsSource.tabs
                        .map((t) => t.toBottomNavigationBarItem())
                        .toList(),
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:films_hub/app/presentation/common/widgets/blur/symmetrical_blur.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_block.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_event.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  static const String navigationPath = '/';

  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void _onItemTapped(int index) {
    context.read<MainBloc>().add(SelectedIndexChangedEvent(index: index));
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (oldState, newState) =>
          oldState.selectedIndex != newState.selectedIndex,
      builder: (context, state) => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          body: state.currentPage,
        ),
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
                child: SafeArea(
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
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
                        items: state.navigationBarItems,
                        currentIndex: state.selectedIndex,
                        onTap: _onItemTapped,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

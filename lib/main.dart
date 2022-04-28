import 'package:films_hub/app/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/colors/custom_colors.dart';
import 'package:films_hub/app/pages/home_page.dart';
import 'package:films_hub/app/repositories/films/extended_fake_films_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontFamily = "Comfortaa";
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child ?? Container(),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Movies List',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: CustomColors.darkBlack,
          fontFamily: fontFamily,
          shadowColor: Colors.white.withOpacity(0.08),
          scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        shadowColor: Colors.black.withOpacity(0.3),
        fontFamily: fontFamily,
      ),
      home: HomePage(
        ExtendedFakeFilmsRepository.delayedInMilliseconds(100),
        title: 'Movies List',
      ),
    );
  }
}

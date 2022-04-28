import 'package:films_hub/app/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/pages/home_page.dart';
import 'package:films_hub/app/repositories/films/extended_fake_films_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor _darkThemeColor = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0x00000000),
      100: Color(0x05050505),
      200: Color(0x10101010),
      300: Color(0xA0A0A0A0),
      400: Color(0xB0B0B0B0),
      500: Color(_bluePrimaryValue),
      600: Color(0xC0C0C0C0),
      700: Color(0xD0D0D0D0),
      800: Color(0xF0F0F0F0),
      900: Color(0xFFFFFFFF),
    },
  );
  static const int _bluePrimaryValue = 0xA0FFFFfF;

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
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: _darkThemeColor,
          fontFamily: fontFamily,
          shadowColor: Colors.white.withOpacity(0.08),
          scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        shadowColor: Colors.black.withOpacity(0.3),
        fontFamily: fontFamily,
      ),
      home: HomePage(ExtendedFakeFilmsRepository.delayedInMilliseconds(100),title: 'Movies List'),
    );
  }
}

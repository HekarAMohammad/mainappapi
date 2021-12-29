import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wecode_2021/src/home_screen/home_screen_view.dart';
import 'package:wecode_2021/src/trainers_screen/trainers_screen_view.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  final String selectedLang = 'ar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          textTheme: TextTheme(
              bodyText1: TextStyle(
            fontFamily: selectedLang == 'ar'
                ? GoogleFonts.robotoCondensed().fontFamily
                : GoogleFonts.roboto().fontFamily,
          )),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreenView(),
        '/trainersScreen': (context) => const TrainersScreenView(),
      },
    );
  }
}

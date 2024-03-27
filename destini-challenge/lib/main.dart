import 'package:destini_challenge_starting/day02_story/story_page.dart';
import 'package:flutter/material.dart';
import 'day01_quizzler/quizzler.dart';
import 'day01_quizzler/xloophone.dart';
import 'day02_story/story_page.dart';
import 'day03_bmi_calc/mini_calculator.dart';
import 'day04_weather/screens/weather_loading_screen.dart';
import 'day05_bitcoin/price_screen.dart';
import 'start_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: <String, WidgetBuilder> {
        XylophonePage.path:  (BuildContext context) => XylophonePage(),
        QuizzlerPage.path:  (BuildContext context) => QuizzlerPage(),
        StoryPage.path:  (BuildContext context) => StoryPage(),
        BmiCalcPage.path:  (BuildContext context) => BmiCalcPage(),
        WeatherStartPage.path:  (BuildContext context) => WeatherStartPage(),
        PricePage.path:  (BuildContext context) => PricePage(),
      },
      home: StartPage(),
    );
  }

}

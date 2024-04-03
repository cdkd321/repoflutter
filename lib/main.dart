import 'day07_todoz/todoz_entry.dart';

import 'day01_quizzler/quizzler.dart';
import 'day01_quizzler/xloophone.dart';
import 'day03_bmi_calc/mini_calculator.dart';
import 'day04_weather/screens/weather_loading_screen.dart';
import 'day05_bitcoin/price_screen.dart';
import 'day02_story/story_page.dart';
import 'day06_fastchat/screen/fast_chat_page.dart';
import 'day06_fastchat/screen/login_page.dart';
import 'day06_fastchat/screen/register_page.dart';
import 'day06_fastchat/screen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'start_page.dart';

void main() async {

runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder> {
        XylophonePage.path:  (BuildContext context) => XylophonePage(),
        QuizzlerPage.path:  (BuildContext context) => QuizzlerPage(),
        StoryPage.path:  (BuildContext context) => StoryPage(),
        BmiCalcPage.path:  (BuildContext context) => BmiCalcPage(),
        WeatherStartPage.path:  (BuildContext context) => WeatherStartPage(),
        PricePage.path:  (BuildContext context) => PricePage(),
        WelcomePage.path: (BuildContext context) => WelcomePage(),
        LoginPage.path: (BuildContext context) => LoginPage(),
        RegistrationPage.path: (BuildContext context) => RegistrationPage(),
        FastChatPage.path: (BuildContext context) => FastChatPage(),
        TodosEntry.path: (BuildContext context) => TodosEntry(),
      },
      home: StartPage(),
    );
  }

}

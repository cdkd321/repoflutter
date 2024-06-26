import 'package:flutter/material.dart';

import 'day01_quizzler/quizzler.dart';
import 'day01_quizzler/xloophone.dart';
import 'day02_story/story_page.dart';
import 'day03_bmi_calc/mini_calculator.dart';
import 'day04_weather/screens/weather_loading_screen.dart';
import 'day05_bitcoin/price_screen.dart';
import 'day06_fastchat/screen/welcome_page.dart';
import 'day07_todoz/todoz_entry.dart';

class StartPage extends StatelessWidget {
  List<String> items = [
    XylophonePage.path,
    QuizzlerPage.path,
    StoryPage.path,
    BmiCalcPage.path,
    WeatherStartPage.path,
    PricePage.path,
    WelcomePage.path,
    TodosEntry.path
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter基础学习'),),
      body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemCount: items.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=> {Navigator.of(context).pushNamed(items[index])},
                child: ListTile(
                  title: Text(items[index], style: TextStyle(fontSize: 20),),
                ),
              );
            },),
        ),
    );
  }

}
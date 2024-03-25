import 'package:destini_challenge_starting/day04_weather/weather_loading.dart';
import 'package:destini_challenge_starting/mini_calc/mini_calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: WeatherLoading(),
    );
  }
}

import 'package:destini_challenge_starting/day04_weather/data/network_helper.dart';
import 'package:destini_challenge_starting/day04_weather/data/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'screens/location_screen.dart';

const Color _kAppColor = Color(0xFFFDDE6F);
const double _kSize = 100;

class WeatherLoading extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WeatherLoadingState();
  }

}

class WeatherLoadingState extends State<WeatherLoading> {

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的天气"),),
      body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: _kAppColor,
          rightDotColor: const Color(0xFFEA3799),
          size: 100,
        ),
      ),
    );
  }

  void loadData() async {
    var weatherData = await WeatherDAO().loadingData();
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=>LocationScreen(
        locationWeather: weatherData,
      )));
  }

}
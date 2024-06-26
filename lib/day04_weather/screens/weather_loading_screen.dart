import '../data/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'location_screen.dart';

const Color _kAppColor = Color(0xFFFDDE6F);
const double _kSize = 100;

class WeatherStartPage extends StatefulWidget {

  static String path = 'weather';

  @override
  State<StatefulWidget> createState() {
    return WeatherStartPageState();
  }

}

class WeatherStartPageState extends State<WeatherStartPage> {

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
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>LocationScreen(
        locationWeather: weatherData,
      )));
  }

}
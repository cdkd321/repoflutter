import 'dart:collection';

import 'package:destini_challenge_starting/day04_weather/data/network_helper.dart';

import '../constants.dart';
import 'location.dart';

const double kLat = 29.5;
const double kLon = -31.22;
class WeatherDAO {
  NetworkHelper networkHelper = NetworkHelper();

  WeatherDAO();

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic>? loadingData() async {
    var location = Location();
    await location.getCurrentLocation();
    var weatherData = networkHelper.getWeatherData(location.getLat(), location.getLon());
    return weatherData;
  }

  Future<dynamic>? getLocationWeather() async {
    var data = await loadingData();
    // weatherMain = data['weather']['main'];
    // temp = data['main']['temp'];
    // description = data['weather']['description'];
    return data;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    Map<String, dynamic> params = new HashMap<String, dynamic>();
    params['q']=cityName;
    params['appid']=kApiKey;
    params['units']='metric';

    var weatherData = await networkHelper.getWeatherDataByCity(params);
    return weatherData;
  }
}
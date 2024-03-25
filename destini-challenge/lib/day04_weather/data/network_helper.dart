import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

class NetworkHelper {
  final String baseWeatherUrl = "api.openweathermap.org";

  Future<dynamic>? getWeatherData(double lat, double lon) async {
    try {
      Map<String, dynamic> params = HashMap<String, String>();
      params["lat"]= '$lat';
      params["lon"]= '$lon';
      params["appid"]= kApiKey;
      http.Response response = await http.get(
          Uri.http(baseWeatherUrl, '/data/2.5/weather', params));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var json = jsonDecode(response.body);
        return json;
      }
    } catch(e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<dynamic>? getWeatherDataByCity(Map<String, dynamic> params) async {
    try {
      http.Response response = await http.get(Uri.http(baseWeatherUrl, '/data/2.5/weather',
          params));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var json = jsonDecode(response.body);
        return json;
      }
    } catch(e) {
      print(e);
      return null;
    }
    return null;
  }
}
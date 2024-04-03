import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';

class RateChange {
  Future<dynamic>? getData(String asset_id_base, String asset_id_quote) async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['apikey']='6427B567-4EE4-4902-9835-62890D2FD151';
      http.Response response =
      await http.get(Uri.https(BASE_URL, PATH_URL + asset_id_base + '/'
          + asset_id_quote, params));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var json = jsonDecode(response.body);
        print(json);
        return json;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
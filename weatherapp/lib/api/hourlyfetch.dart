import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';
import 'package:weatherapp/model/hourly_model.dart';
import 'package:http/http.dart' as http;

class FetchHourlyData {
  Future<Forecast> processHourlyData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    final Map<String, dynamic> weatherData = await jsonDecode(response.body);
    Root currentWeathers = Root.fromJson(weatherData);
    Forecast returnHourlyValue =
        Forecast(forecastday: currentWeathers.forecast!.forecastday);
    // print(returnHourlyValue.forecastday![0]!.hour!.length);
    return returnHourlyValue;
  }

  String apiUrl(lat, long) {
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$apikey&q=$lat,$long";
    return url;
  }
}

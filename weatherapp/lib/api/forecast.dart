import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/forecast_model.dart';

class FetchForestWeatherAPI {
  //process data
  Future<Forecast> processForecastData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    final Map<String, dynamic> weatherData = await jsonDecode(response.body);
    Root currentWeather = Root.fromJson(weatherData);

    Forecast returnValue =
        Forecast(forecastday: currentWeather.forecast!.forecastday);
    // var returnWeather = {
    //   'temp': currentWeather.current!.tempc,
    //   'cloud': currentWeather.current!.cloud,
    //   'humidity': currentWeather.current!.humidity,
    //   'icon': currentWeather.current!.condition!.icon,
    // };
    // print(returnWeather);
    // print(returnValue.condition!.code);
    return returnValue;
  }

  String apiUrl(lat, long) {
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$apikey&q=$lat,$long&days=8&aqi=no&alerts=no";

    return url;
  }
}

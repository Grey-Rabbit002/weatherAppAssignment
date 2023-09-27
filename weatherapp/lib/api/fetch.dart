import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/current_model.dart';

class FetchWeatherAPI {
  //process data
  Future<Current> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    final Map<String, dynamic> weatherData = await jsonDecode(response.body);
    Root currentWeather = Root.fromJson(weatherData);
    Current returnValue = Current(
      cloud: currentWeather.current!.cloud,
      tempc: currentWeather.current!.tempc,
      humidity: currentWeather.current!.humidity,
      condition: currentWeather.current!.condition,
      windkph: currentWeather.current!.windkph,
      feelslikec: currentWeather.current!.feelslikec,
      uv: currentWeather.current!.uv,
    );
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
        "http://api.weatherapi.com/v1/current.json?key=$apikey&q=$lat,$long";
    return url;
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/api/fetch.dart';
import 'package:weatherapp/api/forecast.dart';
import 'package:weatherapp/api/hourlyfetch.dart';
import 'package:weatherapp/model/current_model.dart';
import 'package:weatherapp/model/forecast_model.dart' as forecast;
import 'package:weatherapp/model/hourly_model.dart' as hour;

class GlobalController extends GetxController {
  //variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final _check = Current().obs;
  final _hourCheck = hour.Forecast().obs;

  final _forecasts = forecast.Forecast().obs;
  final RxInt _currentIndex = 0.obs;
  //instance creation
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongittude() => _longitude;

  forecast.Forecast getForecast() {
    return _forecasts.value;
  }

  Current getcurrentWeather() {
    return _check.value;
  }

  hour.Forecast getHourData() {
    return _hourCheck.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    //status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request location
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission is denied");
      }
    }

    // getting current location

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      //update varibales
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      return await FetchWeatherAPI()
          .processData(_latitude.value, _longitude.value)
          .then(
        (value) {
          _check.value = value;
          // print(_check.obs);
        },
      ).then((value) async {
        return await FetchHourlyData()
            .processHourlyData(_latitude.value, _longitude.value)
            .then((value) {
          _hourCheck.value = value;

          // print(_latitude.value);
          // print(_longitude.value);
        }).then((value) async {
          return await FetchForestWeatherAPI()
              .processForecastData(_latitude.value, _longitude.value)
              .then(
            (value) {
              _forecasts.value = value;
              _isLoading.value = false;
              // print(_forecasts.value.forecastday![1]!.hour!.first!.tempc);
            },
          );
        });
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}

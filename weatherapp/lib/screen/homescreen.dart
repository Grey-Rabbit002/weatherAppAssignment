import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/globalcontroller.dart';
import 'package:weatherapp/utils/customcolors.dart';
import 'package:weatherapp/widgets/comfort.dart';
import 'package:weatherapp/widgets/current_weather.dart';
import 'package:weatherapp/widgets/daily_forecast.dart';
import 'package:weatherapp/widgets/header.dart';
import 'package:weatherapp/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child: Image.asset(
                    'assets/icon/clouds.png',
                    height: 200,
                    width: 200,
                  ),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),

                    const CurrentWeatherWidget(),
                    const HourlyDataWidget(),
                    const DailyDataForecastWidget(),
                    //current temperature
                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ComfortLevel(),
                  ],
                ))),
    );
  }
}

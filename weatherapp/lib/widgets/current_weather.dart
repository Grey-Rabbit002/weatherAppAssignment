import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/globalcontroller.dart';
import 'package:weatherapp/utils/customcolors.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({super.key});

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // print("https:${globalController.getcurrentWeather().condition!.icon}");
    return Column(
      children: [
        //temperature area
        temperatureAreaWidget(),
        const SizedBox(
          height: 20,
        ),
        //more details
        currentweatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
          "https:${globalController.getcurrentWeather().condition!.icon}",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${globalController.getcurrentWeather().tempc!.toInt()}°",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 68)),
          TextSpan(
              text: "${globalController.getcurrentWeather().condition!.text}",
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14))
        ])),
      ],
    );
  }

  Widget currentweatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.asset('assets/icon/windspeed.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.asset('assets/icon/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.asset('assets/icon/humidity.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${globalController.getcurrentWeather().windkph}km/ph",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${globalController.getcurrentWeather().cloud}%",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${globalController.getcurrentWeather().humidity}%",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

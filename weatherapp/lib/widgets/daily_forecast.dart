
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/globalcontroller.dart';
import 'package:weatherapp/utils/customcolors.dart';

class DailyDataForecastWidget extends StatefulWidget {
  const DailyDataForecastWidget({super.key});

  @override
  State<DailyDataForecastWidget> createState() =>
      _DailyDataForecastWidgetState();
}

class _DailyDataForecastWidgetState extends State<DailyDataForecastWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style:
                  TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: globalController.getForecast().forecastday!.length > 7
            ? 7
            : globalController.getForecast().forecastday!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                          getDay(globalController
                              .getForecast()
                              .forecastday![index]!
                              .dateepoch),
                          style: const TextStyle(
                              color: CustomColors.textColorBlack,
                              fontSize: 12)),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(
                          "https:${globalController.getForecast().forecastday![index]!.day!.condition!.icon}"),
                    ),
                    Text(
                        "${globalController.getForecast().forecastday![index]!.day!.mintempc!.toInt().toString()}°/${globalController.getForecast().forecastday![index]!.day!.maxtempc!.toInt().toString()}°")
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }
}

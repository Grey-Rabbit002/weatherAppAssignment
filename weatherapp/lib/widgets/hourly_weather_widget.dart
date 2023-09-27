// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/globalcontroller.dart';
import 'package:weatherapp/utils/customcolors.dart';

class HourlyDataWidget extends StatefulWidget {
  const HourlyDataWidget({super.key});

  @override
  State<HourlyDataWidget> createState() => _HourlyDataWidgetState();
}

class _HourlyDataWidgetState extends State<HourlyDataWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  //card index
  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return SizedBox(
      // width: 90,
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            globalController.getHourData().forecastday!.first!.hour!.length > 12
                ? 16
                : globalController
                    .getHourData()
                    .forecastday!
                    .first!
                    .hour!
                    .length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: CustomColors.dividerLine.withAlpha(150))
                  ],
                  gradient: cardIndex.value == index
                      ? const LinearGradient(colors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])
                      : null,
                ),
                child: HourlyDetails(
                  temp: globalController
                      .getHourData()
                      .forecastday!
                      .first!
                      .hour!
                      .elementAt(index)!
                      .tempc,
                  timeStamp: globalController
                      .getHourData()
                      .forecastday![0]!
                      .hour![index]!
                      .timeepoch,
                  icon: globalController
                      .getHourData()
                      .forecastday![0]!
                      .hour![index]!
                      .condition!
                      .icon,
                  index: index,
                  cardIndex: cardIndex.toInt(),
                ),
              )));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  double? temp;
  int? timeStamp;
  String? icon;
  int index;
  int cardIndex;

  HourlyDetails(
      {required this.temp,
      required this.timeStamp,
      required this.icon,
      required this.index,
      required this.cardIndex,
      super.key});

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                  color: cardIndex == index
                      ? Colors.white
                      : CustomColors.textColorBlack)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Image.network(
            "https:$icon",
            height: 60,
            width: 60,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "${temp!.toInt()}°",
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack,
              ),
            ))
      ],
    );
  }
}

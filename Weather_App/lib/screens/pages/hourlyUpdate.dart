import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_appgetx/Models/Weather_hourly.dart';
import 'package:weather_appgetx/controller/globle_controller.dart';

// ignore: must_be_immutable
class HourlyData extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyData({super.key, required this.weatherDataHourly});

  //! Current Time Index
  RxInt cardIndex = GlobleController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
          alignment: Alignment.topCenter,
          child: const Text(
            'TODAY',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        hourlyWeather(),
      ],
    );
  }

  Widget hourlyWeather() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: ListView.builder(
        physics: const ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(
            (() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: cardIndex.value == index
                            ? const LinearGradient(
                                colors: [Colors.red, Colors.purple],
                              )
                            : null),
                    child: Details(
                        index: index,
                        cardIndex: cardIndex.toInt(),
                        timeStamp: weatherDataHourly.hourly[index].dt!,
                        temp: weatherDataHourly.hourly[index].temp!,
                        weatherIcon:
                            weatherDataHourly.hourly[index].weather![0].icon!),
                  ),
                )),
          );
        },
      ),
    );
  }
}

//! Details Weather Class
// ignore: must_be_immutable
class Details extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  Details(
      {super.key,
      required this.temp,
      required this.index,
      required this.cardIndex,
      required this.timeStamp,
      required this.weatherIcon});

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String b = DateFormat('jm').format(time);
    return b;
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
                  color: cardIndex == index ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$weatherIcon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('$temp°',
              style: TextStyle(
                  color: cardIndex == index ? Colors.white : Colors.teal,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

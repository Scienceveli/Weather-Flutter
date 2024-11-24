import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_appgetx/Models/Weather_daily.dart';

class DailyWeather extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyWeather({super.key, required this.weatherDataDaily});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final b = DateFormat('EEE').format(time);
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 2),
            child: const Text(
              'Next Days',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        physics: const ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Image.asset(
                            'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                      ),
                    ),
                    Text(
                      '${weatherDataDaily.daily[index].temp!.min}°/${weatherDataDaily.daily[index].temp!.max}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

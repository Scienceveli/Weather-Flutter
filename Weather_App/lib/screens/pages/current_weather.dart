import 'package:flutter/material.dart';
import 'package:weather_appgetx/Models/Current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherdatacurrent;
  const CurrentWeatherWidget({super.key, required this.weatherdatacurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //!Tempreture Area
        tempAreaWidget(),
        const SizedBox(
          height: 30,
        ),
        //! More Details (Windspeed,Humidity,Clouds)
        currentWeatherDetailsAreaWidgets(),
      ],
    );
  }

  Widget tempAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${weatherdatacurrent.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 60,
          width: 3,
          color: Colors.grey.shade700,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '${weatherdatacurrent.current.temp!.toInt()}°',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: '${weatherdatacurrent.current.weather![0].description}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget currentWeatherDetailsAreaWidgets() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/icons/humidity.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherdatacurrent.current.clouds}%',
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherdatacurrent.current.humidity}%',
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherdatacurrent.current.windSpeed}km/h',
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}

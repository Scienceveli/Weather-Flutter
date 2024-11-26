import 'package:flutter/material.dart';
import 'package:weather_appgetx/Current_weather.dart';
import 'package:weather_appgetx/controller/api/fetch_weather.dart'; // تأكد من المسار الصحيح

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  FetchWeatherApi fetchWeatherApi() => FetchWeatherApi();

  @override
  Widget build(BuildContext context) {
    // جعل المستقبل nullable بإضافة `?` لجعل `weatherData22` يقبل `null`
    var weatherData2 = fetchWeatherApi().getWeatherData(30.033, 31.233);
    Future<WeatherData>? weatherData22 = weatherData2 as Future<WeatherData>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: FutureBuilder<WeatherData>(
        future: weatherData22,  // الآن يقبل `Future<WeatherData>?`
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            WeatherData? weatherData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Temperature: ${weatherData?.current.temp ?? 'N/A'}°C'),
                  Text('Humidity: ${weatherData?.current.humidity ?? 'N/A'}%'),
                  Text('Wind Speed: ${weatherData?.current.windSpeed ?? 'N/A'} km/h'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

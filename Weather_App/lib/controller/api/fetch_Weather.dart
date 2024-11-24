import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_appgetx/Models/Current_weather.dart';
import 'package:weather_appgetx/Models/Weather_daily.dart';
import 'package:weather_appgetx/Models/Weather_hourly.dart';
import 'package:weather_appgetx/screens/Style/url.dart';
import '../../Models/Weatherdata.dart';

class FetchWeatherApi {
  //! Processing The Data From Response => To JSON

  WeatherData? weatherData;

  Future<WeatherData> getWeatherData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    log(response.body);

    var jsonData = jsonDecode(response.body.trim());

    // log(jsonData);

    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonData),
        WeatherDataHourly.fromJson(jsonData),
        WeatherDataDaily.fromJson(jsonData));
    return weatherData!;
  }
}

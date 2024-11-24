import 'package:weather_appgetx/Models/Current_weather.dart';
import 'package:weather_appgetx/Models/Weather_daily.dart';
import 'package:weather_appgetx/Models/Weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}

import 'package:weather_appgetx/Models/Current_weather.dart';
import 'package:weather_appgetx/Models/Weather_daily.dart';
import 'package:weather_appgetx/Models/Weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData({this.current, this.hourly, this.daily});

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;

  // الدالة التي تقوم بتحويل البيانات المستلمة من JSON إلى كائن WeatherData
  static Future<WeatherData> fromJson(Map<String, dynamic> data) async {
    // إذا كانت البيانات غير صحيحة أو فارغة، نرفع استثناء
    try {
      // تحويل البيانات إلى كائنات منفصلة باستخدام fromJson
      WeatherDataCurrent currentWeather = WeatherDataCurrent.fromJson(data['current']);
      WeatherDataHourly hourlyWeather = WeatherDataHourly.fromJson(data['hourly']);
      WeatherDataDaily dailyWeather = WeatherDataDaily.fromJson(data['daily']);

      // إعادة كائن WeatherData يحتوي على البيانات المحولة
      return WeatherData(
        current: currentWeather,
        hourly: hourlyWeather,
        daily: dailyWeather,
      );
    } catch (e) {
      // إذا فشل التحويل، نرفع استثناء مع تفاصيل الخطأ
      throw Exception('Error parsing weather data: $e');
    }
  }
}

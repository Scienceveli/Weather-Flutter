import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_appgetx/Models/WeatherData.dart';

class FetchWeatherApi {
  static const String _apiKey = '60cf256dac4a6842af10a32ebe2e089c';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/onecall';

  Future<WeatherData> getWeatherData(double latitude, double longitude) async {
    final url = '$_baseUrl?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherData.fromJson(data);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}

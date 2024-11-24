import 'package:weather_appgetx/controller/api/api_key.dart';

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metrix&exclude=minutely";
  return url;
}

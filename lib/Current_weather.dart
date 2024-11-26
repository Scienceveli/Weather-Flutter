class WeatherData {
  final CurrentWeather current;

  WeatherData({required this.current});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      current: CurrentWeather.fromJson(json['current']),
    );
  }
}

class CurrentWeather {
  final double temp;
  final int humidity;
  final double windSpeed;

  CurrentWeather({required this.temp, required this.humidity, required this.windSpeed});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temp: json['temp'].toDouble(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'].toDouble(),
    );
  }
}

class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
        current: Current.fromJson(json['current'] ?? {}),  // تجنب حدوث خطأ إذا لم يكن الحقل موجودًا
      );
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  double? uvIndex;
  double? feelIsLike;
  List<Weather>? weather;
  int? pressure;

  Current({
    this.temp,
    this.pressure,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.uvIndex,
    this.feelIsLike,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round() ?? 0,  // القيمة الافتراضية 0
        pressure: json['pressure'] as int?,
        feelIsLike: (json['feels_like'] as num?)?.toDouble(),
        uvIndex: (json['uvi'] as num?)?.toDouble() ?? 0.0,  // القيمة الافتراضية 0.0
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,  // القيمة الافتراضية 0.0
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'pressure': pressure,
        'feels_like': feelIsLike,
        'uvi': uvIndex,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

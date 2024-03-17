import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class WeatherModel {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  DateTime last_updated;
  
  @HiveField(2)
  double temp_c;
  
  @HiveField(3)
  String state_weather;
  
  @HiveField(4)
  String weather_icon;
  
  @HiveField(5)
  double wind_kph;
  
  @HiveField(6)
  int humidity;

  @HiveField(7)
  double lat;

  @HiveField(8)
  double lon;
  WeatherModel({
    required this.name,
    required this.last_updated,
    required this.temp_c,
    required this.state_weather,
    required this.weather_icon,
    required this.wind_kph,
    required this.humidity,
    required this.lat,
    required this.lon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        name: json["location"]["name"],
        last_updated: DateTime.parse(json["current"]["last_updated"]),
        temp_c: json["current"]["temp_c"],
        state_weather: json["current"]["condition"]["text"],
        weather_icon: json["current"]["condition"]["icon"],
        wind_kph: json["current"]["wind_kph"],
        humidity: json["current"]["humidity"],
        lat: json["location"]["lat"],
        lon: json["location"]["lon"],
      );
  Map<String, dynamic> toJson() => {
    "name" : name,
    "last_updated" : last_updated,
    "temp_c" : temp_c,
    "state_weather" : state_weather,
    "weather_icon" : weather_icon,
    "wind_kph" :wind_kph,
    "humidity" : humidity,
    "lat" : lat,
    "lon" : lon,
  };

}


class WeatherModel {
  String name;
  DateTime last_updated;
  double temp_c;
  String state_weather;
  String weather_icon;
  double wind_kph;
  int humidity;

  WeatherModel({
    required this.name,
    required this.last_updated,
    required this.temp_c,
    required this.state_weather,
    required this.weather_icon,
    required this.wind_kph,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        name: json["location"]["name"],
        last_updated: DateTime.parse(json["current"]["last_updated"]),
        temp_c: json["current"]["temp_c"],
        state_weather: json["current"]["condition"]["text"],
        weather_icon: json["current"]["condition"]["icon"],
        wind_kph: json["current"]["wind_kph"],
        humidity: json["current"]["humidity"],
      );
  Map<String, dynamic> toJson() => {
    "name" : name,
    "last_updated" : last_updated,
    "temp_c" : temp_c,
    "state_weather" : state_weather,
    "weather_icon" : weather_icon,
    "wind_kph" :wind_kph,
    "humidity" : humidity,
  };

}


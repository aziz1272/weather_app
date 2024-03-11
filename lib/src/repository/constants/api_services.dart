import 'dart:convert';
import 'package:weather_app/src/repository/constants/api_constants.dart';
import 'package:weather_app/src/repository/services/main_service.dart';
import '../models/weather_model.dart';

class ApiServices {
  static Future<WeatherModel> getWeatherData({required String region}) async {
    String key = "687716fb5f3c4fd089f102243240903";
    String aqi = "no";

    final response = await API().GET(path: Api.getWeatherData, params: {
      "key": "687716fb5f3c4fd089f102243240903",
      "q": region,
      "aqi": "no"
    });
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    }
    return WeatherModel(
        name: '',
        last_updated: DateTime.now(),
        temp_c: 0,
        state_weather: '',
        weather_icon: '',
        wind_kph: 0,
        humidity: 0);
  }
}

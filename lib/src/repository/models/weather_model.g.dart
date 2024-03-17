import 'package:hive/hive.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1; // Unique identifier for the type

  @override
  WeatherModel read(BinaryReader reader) {
    return WeatherModel(
      name: reader.readString(),
      last_updated: DateTime.parse(reader.readString()),
      temp_c: reader.readDouble(),
      state_weather: reader.readString(),
      weather_icon: reader.readString(),
      wind_kph: reader.readDouble(),
      humidity: reader.readInt(),
      lat: reader.readDouble(),
      lon: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.last_updated.toIso8601String());
    writer.writeDouble(obj.temp_c);
    writer.writeString(obj.state_weather);
    writer.writeString(obj.weather_icon);
    writer.writeDouble(obj.wind_kph);
    writer.writeInt(obj.humidity);
    writer.writeDouble(obj.lat);
    writer.writeDouble(obj.lon);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/repository/models/weather_model.g.dart';
import 'package:weather_app/src/services/local%20service/local_database_service.dart';
import 'package:weather_app/src/ui/pages/search%20city%20page/search_city_page.dart';
import 'package:weather_app/src/ui/pages/searchpage/search_page.dart';

void main() async{
  LocalDatabaseService localService = LocalDatabaseService();
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherModelAdapter());
  await Hive.openBox<WeatherModel>('WeatherKey');
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
      routes: {
        SearchPage.id: (context) => const SearchPage(),
        SearchCityPage.id:(context)=> const SearchCityPage(),
      },
    );
  }
}


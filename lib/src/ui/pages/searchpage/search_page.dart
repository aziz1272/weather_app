import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/constants/api_services.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/ui/pages/searchpage/shimmer_widget.dart';
import 'package:weather_app/src/ui/pages/searchpage/weather_container.dart';
import 'package:weather_app/src/ui/pages/second%20page/second_page.dart';
import 'package:weather_app/src/ui/widgets/color_widgets.dart';
import 'package:weather_app/src/ui/widgets/container_widget.dart';

class SearchPage extends StatefulWidget {
  static const String id = "search_page";

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<WeatherModel> list = [];
  TextEditingController cityName = TextEditingController();
  List cities = [];

  getCities() async {
    String city = cityName.text.trim();
    ApiServices.getWeatherData(region: city).then((value) =>
    {
      print(value.name),
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondPage(model: value),
        ),
      )
    });
  }

  getModel() async {
    final response1 = await ApiServices.getWeatherData(region: "Tokio");
    final response2 = await ApiServices.getWeatherData(region: "Bukhara");
    final response3 = await ApiServices.getWeatherData(region: "Washington");
    setState(() {
      list.add(response1);
      list.add(response2);
      list.add(response3);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getModel();
    //Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        title: const Text(
          "Weather",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
      ),
      body: ContainerWidget(child_widget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: cityName,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: getCities,
                    icon: const Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Search for a city",
                ),
              ),
            ),
            list.isNotEmpty
                ? WeatherContainer(model: list[0],)
                : const ShimmerWidget(),
            list.isNotEmpty
                ? WeatherContainer(model: list[1])
                : const ShimmerWidget(),
            list.isNotEmpty
                ? WeatherContainer(model: list[2])
                : const ShimmerWidget(),
          ],
        ),
      ),
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/ui/pages/second%20page/wind_humidity_widget.dart';
import 'package:weather_app/src/ui/widgets/color_widgets.dart';
import 'package:weather_app/src/ui/widgets/container_widget.dart';

class SecondPage extends StatefulWidget {
  static const String id = "second_page";
  WeatherModel model;

  SecondPage({
    required this.model,
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        elevation: 0,
      ),
      body: ContainerWidget(
        child_widget: widget.model.name.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.model.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                    Text(
                      widget.model.last_updated.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('http:' + widget.model.weather_icon),
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.model.temp_c} C",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${widget.model.state_weather}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    WindHumidityWidget(model: widget.model),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/1400397-200.png")
                        )
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "Bunday shahar\ntopilmadi!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                    ),
                  textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

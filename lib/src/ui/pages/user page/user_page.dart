import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/ui/screens/navigator_button.dart';
import '../../screens/map screen/map screen.dart';
import '../../widgets/color_widgets.dart';
import '../../widgets/container_widget.dart';
import '../second page/wind_humidity_widget.dart';

class UserPage extends StatelessWidget {
  WeatherModel model;

  UserPage({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ContainerWidget(
        child_widget: SingleChildScrolView(context),
      ),
    );
  }

  Widget SingleChildScrolView(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: ssd.height * 0.026,
                overflow: TextOverflow.ellipsis),
            maxLines: 1,
          ),
          Text(
            model.last_updated.toString(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: ssd.height * 0.022,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: ssd.height * 0.24,
            width: ssd.width * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('http:' + model.weather_icon),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${model.temp_c} C",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${model.state_weather}",
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          WindHumidityWidget(model: model),
          NavigatorButton(onpressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapScreen(model: model,)),
            );
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';

class WeatherContainer extends StatelessWidget {

  WeatherModel model;
  WeatherContainer({
    required this.model,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.purple),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              Text(
                model.state_weather,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              Text(
                "${model.temp_c.toInt()} C",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ],
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('http:${model.weather_icon}'),
                )),
          ),
        ],
      ),
    );
  }
}

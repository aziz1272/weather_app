import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';

class WindHumidityWidget extends StatelessWidget {
  WeatherModel model;
  WindHumidityWidget({
    required this.model,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.purple),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  "shamol tezligi",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 16,),
                RichText(
                    text: TextSpan(
                      text: "${model.wind_kph}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [TextSpan(text: " m/s")],
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Nisbiy namlik",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 16,),
                RichText(
                    text: TextSpan(
                      text: "${model.humidity}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [TextSpan(text: " %")],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/constants/api_services.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/ui/pages/searchpage/search_page.dart';
import 'package:weather_app/src/ui/pages/second%20page/wind_humidity_widget.dart';
import 'package:weather_app/src/ui/screens/navigator_button.dart';
import 'package:weather_app/src/ui/widgets/color_widgets.dart';
import 'package:weather_app/src/ui/widgets/container_widget.dart';
import '../../../services/local service/local_database_service.dart';
import '../../screens/map screen/map screen.dart';


class SecondPage extends StatefulWidget {
  static const String id = "second_page";
  String cityName;

  SecondPage({
    required this.cityName,
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<WeatherModel> list = [];

  LocalDatabaseService localService = LocalDatabaseService();

  getMessages() async {
    final response = await ApiServices.getWeatherData(region: widget.cityName);
    setState(() {
      list.add(response);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SearchPage.id);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ContainerWidget(
        child_widget: list.isEmpty
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: const CircularProgressIndicator(),
                ),
              )
            : list.first.name.isNotEmpty
                ? SingleChildScrolView()
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
                                  image: AssetImage(
                                      "assets/images/1400397-200.png"))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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

  Widget SingleChildScrolView() {
    Size ssd = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            list.first.name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: ssd.height*0.026,
                overflow: TextOverflow.ellipsis),
            maxLines: 1,
          ),
          Text(
            list.first.last_updated.toString(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: ssd.height*0.022,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: ssd.height*0.24,
            width: ssd.width*0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('http:' + list.first.weather_icon),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${list.first.temp_c} C",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${list.first.state_weather}",
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          WindHumidityWidget(model: list.first),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  List lst = [];
                  lst.add(list.first);
                  if (await localService.getList("Key") == null) {
                    await localService.addList(lst, "Key");
                  } else {
                    List list1 = [];
                    bool test = true;
                    for (WeatherModel item in await localService.getList("Key")) {
                      list1.add(item);
                      if (item.name == list.first.name) test = false;
                    }
                    if (test) {
                      list1.insert(0,list.first);
                      await localService.addList(list1, "Key");
                      CherryToast(
                        icon: Icons.check,
                        themeColor: Colors.purple,
                        description: const Text("saved successfully",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        toastPosition: Position.bottom,
                        animationDuration: Duration(milliseconds: 1000),
                        autoDismiss: true,
                      ).show(context);
                    } else {
                      CherryToast(
                        icon: Icons.navigate_before,
                        themeColor: Colors.purple,
                        description: const Text("previously saved",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        toastPosition: Position.bottom,
                        animationDuration: Duration(milliseconds: 1000),
                        autoDismiss: true,
                      ).show(context);
                    }
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
              ),
              NavigatorButton(onpressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen(model: list.first,)),
                );
              }),
            ],
          ),

        ],
      ),
    );
  }
}

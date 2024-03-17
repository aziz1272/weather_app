import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/repository/constants/api_services.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import 'package:weather_app/src/services/local%20service/local_database_service.dart';
import 'package:weather_app/src/ui/pages/search%20city%20page/search_city_page.dart';
import 'package:weather_app/src/ui/pages/searchpage/body_container_search.dart';
import 'package:weather_app/src/ui/pages/user%20page/user_page.dart';
import 'package:weather_app/src/ui/widgets/color_widgets.dart';
import '../../screens/map screen/map screen.dart';

class SearchPage extends StatefulWidget {
  static const String id = "search_page";

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  LocalDatabaseService localDatabaseService = LocalDatabaseService();
  List lst = [];

  saveCities()async {
    for(WeatherModel item in await localDatabaseService.getList("Key")){
      setState(() {
        lst.add(item);
      });
    }
  }

  check_the_internet()async{
    if (await ConnectivityWrapper.instance.isConnected) {
      reff();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveCities();
    check_the_internet();
  }

  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        title: Text(
          "Weather",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: ssd.height * 0.036,
          ),
        ),
        leading: const SizedBox(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade400, Colors.deepPurple],
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              child: const BodyContainerSearch(),
              onTap: () {
                Navigator.pushNamed(context, SearchCityPage.id);
              },
            ),
            SizedBox(
              height: ssd.height * 0.016,
            ),
            RefreshIndicator(onRefresh:reff, child: Container(
              width: ssd.width,
              height: ssd.height * 0.79,
              child: ListView.builder(
                itemCount: lst.length,
                itemBuilder: (BuildContext context, int index) {
                  return responseContainer(index);
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
 Future<void> reff()async {
    List nameList = [];
    for(WeatherModel name in lst){
      nameList.add(name.name);
    }
    List<WeatherModel> newData =[];
    for(String city in nameList){
      final response = await ApiServices.getWeatherData(region: city);
      newData.add(response);
      Future.delayed(Duration.zero);
    }
    setState(() {
      lst = newData;
    });
   await localDatabaseService.addList(newData, "Key");
 }

  Widget responseContainer(int index){
    Size ssd = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage(model: lst[index])),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: ssd.height * 0.12,
        width: ssd.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.purple, width: 2),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: ssd.height * 0.12,
              width: ssd.width * 0.14,
              decoration: const BoxDecoration(
                border:
                Border(right: BorderSide(color: Colors.black)),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen(model: lst[index],)),
                  );
                },
                icon: Icon(Icons.location_on_outlined, color: Colors.green.shade900,),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lst[index].name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ssd.height * 0.022,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    lst[index].state_weather,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: ssd.height * 0.021,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    "${lst[index].temp_c.toInt()} C",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ssd.height * 0.022,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              height: ssd.height * 0.08,
              width: ssd.width * 0.16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    NetworkImage("http:${lst[index].weather_icon}"),
                  )),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      lst.removeAt(index);
                      localDatabaseService.addList(lst, "Key");
                    });
                  },
                  icon: const Icon(Icons.clear),
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/src/services/local%20service/local_database_service.dart';
import 'package:weather_app/src/ui/pages/search%20city%20page/body_container.dart';
import 'package:weather_app/src/ui/pages/search%20city%20page/builder_name.dart';
import 'package:weather_app/src/ui/pages/second%20page/second_page.dart';
import 'package:weather_app/src/ui/widgets/color_widgets.dart';

class SearchCityPage extends StatefulWidget {
  static const String id = "search_city_page";

  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {

  LocalDatabaseService localService = LocalDatabaseService();
  TextEditingController controllername = TextEditingController();
  List<String> list2 = [];
  List<String> list = [];

  enterLocal() {
    String str = controllername.text.trim();
    setState(() {
      list2.add(str);
    });
  }

  getMessageLocal()async {
    for(String item in await localService.getList2("Key2")){
      setState(() {
        list.add(item);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessageLocal();
  }

  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controllername,
          decoration: const InputDecoration(
              hintText: "Search for a city", border: InputBorder.none),
        ),
        elevation: 2,
        shadowColor: Colors.black,
      ),
      floatingActionButton: GestureDetector(
        child: const BodyContainer(),
        onTap: () async{
          enterLocal();
          List<String> lst = [];
          lst.add(list2.first);
          if (await localService.getList2("Key2") == null) {
            await localService.addList2(lst, "Key2");
          } else {
            List list1 = [];
            bool test = true;
            for (String item in  await localService.getList2("Key2")) {
              list1.add(item);
              if (item == list2.first) test = false;
            }
            if (test) {
              list1.insert(0,list2.first);
             await localService.addList2(list1, "Key2");
            }
          }
          String str = controllername.text.trim();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SecondPage(
                cityName: str,
              ),
            ),
          );
        },
      ),
      body: BuilderName(list: list,),
    );
  }
}

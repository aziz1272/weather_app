import 'package:flutter/material.dart';
import 'package:weather_app/src/services/local%20service/local_database_service.dart';
import '../second page/second_page.dart';

class BuilderName extends StatefulWidget {

  List list;
  BuilderName({
    required this.list,
    super.key});

  @override
  State<BuilderName> createState() => _BuilderNameState();
}

class _BuilderNameState extends State<BuilderName> {

  LocalDatabaseService localService = LocalDatabaseService();
  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return Container(
      height: ssd.height,
      width: ssd.width,
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    cityName: widget.list[index],
                  ),
                ),
              );
            },
            child: Container(
                height: 54,
                width: ssd.width,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10,),
                      alignment: Alignment.centerLeft,
                      height: 54,
                      width: ssd.width * 0.7,
                      child: Text(
                        widget.list[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.list.removeAt(index);
                          localService.addList2(widget.list, "Key2");
                        });
                      },
                      icon: Icon(Icons.clear),
                      color: Colors.grey,
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}

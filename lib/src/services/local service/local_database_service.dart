import 'package:hive/hive.dart';

class LocalDatabaseService {

  String boxName = "KeyWeather";
  String boxName2 = "SearchCity";
  String id = "Key";
  String id2 = "Key2";

  //open box
  Future<Box<List>> box(){
    var box = Hive.openBox<List>(boxName);
    return box;
  }

  Future<Box<List>> box2(){
    var box = Hive.openBox<List>(boxName2);
    return box;
  }

  //add
addList(List newList, String id)async{
    var myBox =await box();
    myBox.put(id, newList);
  }

  addList2(List newlist, String id2) async{
    var myBox = await box2();
    myBox.put(id2, newlist);
  }

  getList(String id) async{
    var myBox = await box();
    List list = [];
    list.addAll(myBox.get(id) ?? []);
    return list;
  }

  getList2(String id2) async{
    var myBox = await box2();
    List list = [];
    list.addAll(myBox.get(id2)??[]);
    return list;
  }

}

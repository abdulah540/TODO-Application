import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //List<List<dynamic>> todoList = [];
  List todoList = [];
  //reference the hive box
  final _myBox = Hive.box("mybox");
  //first time ever opening the app, then create default data
  void createInitialData() {
    todoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    // save the initial list so it persists
    updateDatabase();
  }

  void loadData() {
    //if there is already data, then load it
    todoList = _myBox.get("TODOLIST");
  }

  /// write the current list back to Hive
  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}

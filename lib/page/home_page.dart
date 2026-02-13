import 'package:flutter/material.dart';
import 'package:todo/utilities/dialog_box.dart';
import 'package:todo/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List todoList = [
  ["Make Tutorial", false],
  ["Do Exercise", false],
  ["Play Game", false],
];

  //checkbox was tapped
  void CheckBoxChanged(bool? value,int index){
    setState(() {
      todoList[index][1]=!todoList[index][1];
    });
  }

  //create a new task
  // ignore: non_constant_identifier_names
  void CreateNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onsave: saveNewTask,
        oncancel: () => Navigator.of(context).pop(),
      );
    });
  }

  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
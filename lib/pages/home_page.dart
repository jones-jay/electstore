import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to/data/database.dart';
import 'package:to/util/dialogbox.dart';
import 'package:to/util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
      } else {
      db.loadData();
    }

    super.initState();
  }
  // hive box
  final _myBox = Hive.box('mybox');

  // controller to textfield
  final _controller = TextEditingController();

 toDoDataBase db = toDoDataBase();

  void completeTask (bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Saving a task after typing 
  void taskSaved () {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // After accessing the add button
  void addNewTask () {
    showDialog(
      context: context, 
      builder: (context) {
        return Dialogbox(
        controller: _controller,
        Save: taskSaved,
        Cancel: () => Navigator.of(context).pop(),
        );
      },);
  }

  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO DO"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
      backgroundColor: Colors.yellow,
      child: Icon(Icons.add),),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            taskName: db.toDoList[index][0], 
            checkedBox: db.toDoList[index][1], 
            onChanged: (value) => completeTask (value, index),
            deleteFunction: (context) => deleteTask(index),);
        },)
      
    );
  }
}
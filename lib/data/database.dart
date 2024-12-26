import 'package:hive_flutter/hive_flutter.dart';

class toDoDataBase {

  List toDoList = []; 
  
  final _myBox = Hive.box('mybox');


   void createInitialData () {
   toDoList = [
    ["Making tutorial", false],
    ["Do exercise", false]
  ];
   }

   void loadData () {
    toDoList = _myBox.get("TODOLIST");
   } 

   void updateDataBase () {
    _myBox.put("TODOLIST", toDoList);
   }
}
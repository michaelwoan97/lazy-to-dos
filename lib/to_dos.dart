// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:uuid/uuid.dart';

class ToDos {
  static final ToDos _singleton = ToDos._internal();
  List<Map<String, Object>> toDos = [
  ];


  factory ToDos() {
    return _singleton;
  }

  List<Map<String, Object>> get toDoList {
    return toDos;
  }

  // create function for update status each to do
  int updateToDoStatus(String id, bool status){
    int retCode = 0;
    toDos.forEach((element) {
      if(element['id'] == id){
        element['completed'] = status;
        retCode = 1;
      }
    });

    return retCode;
  }

  // function to get particular to do info
  Object getToDo(String id){
    Object toDoFound = {};

    toDos.forEach((element) {
      if(element['id'] == id){
        toDoFound = element;
      }
    });

    return toDoFound;
  }

  // create function for delete each to do
  void deleteToDo(String id){
    toDos.removeWhere((element) => element['id'] == id);
  }

  // function for add to do
  void addToDo(String sToDo){
    var uuid = Uuid();
    Map<String, Object> mToDo = {
      'id': uuid.v1().toString(),
      'toDo': sToDo,
      'completed': false,
    };
    toDos.add(mToDo);
  }

  ToDos._internal();
}
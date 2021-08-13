// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new

// return message when list is empty
import 'package:flutter/material.dart';
import './to_do_list.dart';
import './to_dos.dart';
import './to_do_empty.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToDoAppState();
  }
}

class _ToDoAppState extends State<ToDoApp> {
  TextEditingController todoMsgController = new TextEditingController();

  void addToDo() {
    // check whether the to do message is empty
    if (todoMsgController.text.isNotEmpty) {
      setState(() {
        ToDos().addToDo(todoMsgController.text);
        todoMsgController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var toDos = ToDos().toDoList;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("LazyToDos"),
          ),
          body: toDos.isEmpty
              ? ToDoEmpty()
              : Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                            ...(toDos).map((toDo) {
                              return ToDoList(toDo);
                            }).toList(),
                          ],
                        ),
                ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 8,
                    left: 16,
                    top: 0,
                    bottom: 8,
                  ),
                  child: TextField(
                    controller: todoMsgController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter a search term",
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 8,
                  left: 0,
                  top: 0,
                  bottom: 8,
                ),
                child: FloatingActionButton(
                    onPressed: addToDo, child: Icon(Icons.add)),
              ),
            ],
          )),
    );
  }
}

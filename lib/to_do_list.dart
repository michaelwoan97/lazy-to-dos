// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './to_dos.dart';
import './to_do_empty.dart';

class ToDoList extends StatefulWidget {
  var toDo;

  ToDoList(this.toDo);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToDoListState();
  }
}

class _ToDoListState extends State<ToDoList> {
  // function used for update the opposite status of each to do
  void checkToDo() {
    bool toDoStatus = !widget.toDo['completed'];
    int retCode = ToDos().updateToDoStatus(widget.toDo['id'], toDoStatus);
    if (retCode != 0) {
      setState(() {
        widget.toDo = ToDos().getToDo(widget.toDo['id']);
      });
    }
  }

  void deleteToDo() {
    setState(() {
      ToDos().deleteToDo(widget.toDo['id']);
      widget.toDo = ToDos().getToDo(widget.toDo['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ToDos().toDoList.isEmpty) {
      return ToDoEmpty();
    } else {
      return widget.toDo['id'] == null
          ? Container()
          : Container(
              margin: EdgeInsets.only(
                top: 0,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(
                      widget.toDo.isEmpty
                          ? "Invalid todos!"
                          : widget.toDo['toDo'].toString(),
                      style: !widget.toDo['completed']
                          ? TextStyle(decoration: TextDecoration.none)
                          : TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.green,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: checkToDo,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.red,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                      onPressed: deleteToDo,
                    ),
                  ),
                ],
              ),
            );
    }
  }
}

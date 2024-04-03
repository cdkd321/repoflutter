
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import '../model/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  Function addTaskPressed;
  AddTaskScreen({required this.addTaskPressed});

  @override
  AddTaskScreenState<AddTaskScreen> createState() {
    return AddTaskScreenState();
  }
}

class AddTaskScreenState<AddTaskScreen> extends State {
  late String newTaskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          height: 500,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                const Text("add task",
                  style: TextStyle(fontSize: 25, color: Colors.lightBlueAccent),),
                SizedBox(height: 10),
                TextField(
                    decoration: kInputDecoration,
                    onChanged: (newTitle) {
                  setState(() {
                    newTaskTitle = newTitle;
                    print("after change: $newTaskTitle");
                  });
                }),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {
                  Provider.of<TaskModel>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                }, child: Text("add", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),)
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/add_task_screen.dart';
import 'model/task_model.dart';
import 'components/task_list_view.dart';


class TodosEntry extends StatelessWidget {
  static var path = 'todoz_entry';

  const TodosEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: MaterialApp(home: TodoScreen()),
    );
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context,
            builder: (BuildContext context) => AddTaskScreen(
                addTaskPressed: ()=>{}));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.list, size: 20,
                          color: Colors.blueAccent),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("todoez", style: TextStyle(color: Colors.white, fontSize: 30)),
                            Text("${Provider.of<TaskModel>(context).taskCount} tasks", style: TextStyle(color: Colors.white, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))
                      ),
                      child: TaskListView(),
                    ),
                  )
                ]
            ),
          ),
        ));
  }
}



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_model.dart';
import 'task_tile.dart';

class TaskListView extends StatelessWidget {

  late Function onChecked;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskModel, child) {
      return ListView.builder(itemCount: taskModel.taskCount,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            var task = taskModel.taskList[index];
            return TaskTile(
                isCheck: task.isCheck,
                title: task.name, onChecked: () => {
                  taskModel.updateTask(task)
            }, onItemLongPress: () {
                  taskModel.removeTask(task);
            },);
          });
    });
  }
}




import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'toto_task.dart';

class TaskModel extends ChangeNotifier {
  final List<TodoTask> _taskList = [];

  int get taskCount => _taskList.length;

  UnmodifiableListView<TodoTask> get taskList {
   return UnmodifiableListView(_taskList);
  }

  updateTask(TodoTask task) {
    task.taskDone();
    notifyListeners();
  }

  addTask(String title) {
    TodoTask task = TodoTask(name: title, isCheck: false);
    _taskList.add(task);
    notifyListeners();
  }

  removeTask(TodoTask task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
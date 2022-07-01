import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task.dart';

class AppStateManager extends ChangeNotifier {
  final List<Task> _tasks = [Task(name: 'Hello World')];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Task getTask(int index) {
    return _tasks[index];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

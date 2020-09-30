import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String title) {
    if (title.isNotEmpty) {
      _tasks.add(Task(title: title));

      notifyListeners();
    }
  }

  void removeTask(int index) {
    _tasks.removeAt(index);

    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleCompletion();

    notifyListeners();
  }
}

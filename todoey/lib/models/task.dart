import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  final String title;
  bool completed;

  Task({this.title, this.completed = false});

  void toggleCompletion() {
    completed = !completed;
  }
}

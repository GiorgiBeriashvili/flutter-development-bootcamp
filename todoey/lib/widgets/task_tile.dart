import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool completed;
  final Function onChanged;
  final Function onLongPress;

  TaskTile({this.title, this.completed, this.onChanged, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.title,
        style: TextStyle(
          decoration:
              completed ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: this.completed,
        onChanged: this.onChanged,
      ),
      onLongPress: this.onLongPress,
    );
  }
}

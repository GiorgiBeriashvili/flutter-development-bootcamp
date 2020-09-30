import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return TaskTile(
              title: task.title,
              completed: task.completed,
              onChanged: (value) => taskData.updateTask(task),
              onLongPress: () => taskData.removeTask(index),
            );
          },
          itemCount: taskData.taskCount,
        ),
      ),
    );
  }
}

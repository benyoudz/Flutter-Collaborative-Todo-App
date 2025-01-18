import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/firestore_service.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final FirestoreService _firestoreService = FirestoreService();

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.task, style: TextStyle(decoration: task.completed ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        value: task.completed,
        onChanged: (value) {
          _firestoreService.updateTask(Task(id: task.id, task: task.task, completed: value!));
        },
      ),
      onLongPress: () {
        _firestoreService.deleteTask(task.id);
      },
    );
  }
}

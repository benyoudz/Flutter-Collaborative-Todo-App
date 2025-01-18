import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/task.dart';
import '../widgets/task_input.dart';
import '../widgets/task_tile.dart';

class TodoScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: StreamBuilder<List<Task>>(
        stream: _firestoreService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final tasks = snapshot.data ?? [];
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(task: tasks[index]);
            },
          );
        },
      ),
      floatingActionButton: TaskInput(onSubmit: (task) {
        _firestoreService.addTask(task);
      }),
    );
  }
}

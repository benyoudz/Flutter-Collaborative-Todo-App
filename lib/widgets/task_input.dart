import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final Function(String) onSubmit;

  TaskInput({required this.onSubmit});

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final task = _controller.text;
    if (task.isNotEmpty) {
      widget.onSubmit(task);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: TextField(controller: _controller, onSubmitted: (_) => _submit(), decoration: InputDecoration(hintText: 'Add a new task'))),
          IconButton(icon: Icon(Icons.add), onPressed: _submit),
        ],
      ),
    );
  }
}

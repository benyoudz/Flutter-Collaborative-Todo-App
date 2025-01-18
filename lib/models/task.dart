class Task {
  String id;
  String task;
  bool completed;

  Task({required this.id, required this.task, this.completed = false});

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'completed': completed,
    };
  }

  Task.fromMap(String id, Map<String, dynamic> map)
      : id = id,
        task = map['task'],
        completed = map['completed'];
}

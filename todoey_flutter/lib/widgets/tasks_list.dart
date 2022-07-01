import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy a milk'),
    Task(name: 'Go to date'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isDone,
            taskTitle: tasks[index].name,
            checkboxCallback: (value) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
    );
  }
}

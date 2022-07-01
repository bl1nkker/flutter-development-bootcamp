import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/app_state_manager.dart';
import 'package:todoey_flutter/model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final Task task = Provider.of<AppStateManager>(context).getTask(index);
    return ListTile(
      title: Text(task.name,
          style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: task.isDone,
          onChanged: (value) {
            Provider.of<AppStateManager>(context, listen: false)
                .toggleTaskDone(index);
          }),
    );
  }
}

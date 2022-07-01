import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void toggleCheckboxState(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: (value) => toggleCheckboxState(value),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final Function toggleCheckboxState;
  final bool checkboxState;
  const TaskCheckbox(
      {Key? key,
      required this.checkboxState,
      required this.toggleCheckboxState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checkboxState,
        onChanged: (value) {
          toggleCheckboxState(value);
        });
  }
}

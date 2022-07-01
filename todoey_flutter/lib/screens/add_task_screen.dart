import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/app_state_manager.dart';
import 'package:todoey_flutter/model/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: taskController,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 5)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Task newTask = Task(name: taskController.text);
                  Provider.of<AppStateManager>(context, listen: false)
                      .addTask(newTask);
                  Navigator.pop(context);
                },
                child: Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.lightBlueAccent,
                  child: const Center(
                      child: Text(
                    'Add Task',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

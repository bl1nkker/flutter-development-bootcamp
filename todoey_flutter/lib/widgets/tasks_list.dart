import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/app_state_manager.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: ((context, AppStateManager appStateManager, child) =>
          ListView.builder(
            itemCount: appStateManager.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                index: index,
              );
            },
          )),
    );
  }
}

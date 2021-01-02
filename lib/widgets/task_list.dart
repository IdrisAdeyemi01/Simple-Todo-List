import 'package:Simple_Todo_List/models/data.dart';
import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              taskName: taskData.tasksList[index].name,
              isChecked: taskData.tasksList[index].isDone,
              checkboxCallBack: (newValue) {
                taskData.toggleTask(taskData.tasksList[index]);
              },
              dismissibleKey: taskData.tasksList[index].name,
              callbackToDismiss: () {
                taskData.removeTask(taskData.tasksList[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}

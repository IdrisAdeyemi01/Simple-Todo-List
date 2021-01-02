import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.isChecked,
      this.taskName,
      this.checkboxCallBack,
      this.dismissibleKey,
      this.callbackToDismiss});
  final bool isChecked;
  final String taskName;
  final Function checkboxCallBack;

  final String dismissibleKey;
  final Function callbackToDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(dismissibleKey),
      confirmDismiss: (direction) async {
        bool result;
        if (direction != DismissDirection.horizontal) {
          result = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Do you wish to delete this task?'),
                  actions: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                          onTap: callbackToDismiss, child: Text('Delete')),
                    ),
                  ],
                );
              });
        }
        return result;
      },
      background: Container(
        color: Colors.lightBlueAccent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.lightBlueAccent,
        child: Row(
          children: [
            Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ListTile(
          title: Text(
            taskName,
            style: TextStyle(
              decoration: isChecked == true ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkboxCallBack,
          ),
        ),
      ),
    );
  }
}

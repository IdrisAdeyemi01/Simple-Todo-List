import 'package:Simple_Todo_List/models/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TextEditingController _textController = TextEditingController();
    String newTaskName;
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
            ),
            TextField(
                // controller: _textController,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(),
                // onEditingComplete: () {
                //   _textController.value;
                // },
                onChanged: (newValue) {
                  newTaskName = newValue;
                }),
            SizedBox(height: 10),
            FlatButton(
              color: Colors.lightBlueAccent,
              height: 50,
              onPressed: () {
                Provider.of<Data>(context, listen: false).addNewTask(newTaskName);
                Navigator.pop(context);
              },
              child: Center(
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

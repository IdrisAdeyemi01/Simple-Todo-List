import 'package:flutter/material.dart';
import 'package:Simple_Todo_List/models/tasks.dart';
// import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// class SharedPrefs{

// }

class Data extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  Data() {
    setup();
  }

  setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
    notifyListeners();
  }

  List<Task> tasksList = [
    Task(name: 'Goto the gym'),
    Task(name: 'Write an article'),
    Task(name: 'Go for a walk')
  ];

  void saveData() {
    List<String> splist =
        tasksList.map((item) => json.encode(item.toMap())).toList();
    print(splist);
    sharedPreferences.setStringList('tasksList', splist);
  }

  void loadData() {
    List<String> splist = sharedPreferences.getStringList('tasksList');
    tasksList = splist.map((item) => Task.fromMap(jsonDecode(item))).toList();
    notifyListeners();
  }

  int get taskCount {
    return tasksList.length;
  }

  void addNewTask(String newTask) {
    tasksList.add(Task(name: newTask));
    saveData();
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    saveData();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasksList.remove(task);
    saveData();
    notifyListeners();
  }
}

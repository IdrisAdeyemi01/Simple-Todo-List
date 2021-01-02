class Task {
  Task({this.isDone = false, this.name});

  bool isDone;
  final String name;

  void toggleDone() {
    isDone = !isDone;
  }

  // factory Task.fromJson(Map jsonData) {
  //   return Task(name: jsonData['name'],
  //   isDone: jsonData['isDone']
  //   );}
  Task.fromMap(Map map)
      : this.name = map['name'],
        this.isDone = map['isDone'];
  Map toMap() {
    return {
      'name': this.name,
      'isDone': this.isDone,
    };
  }
}

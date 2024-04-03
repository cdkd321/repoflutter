class TodoTask {
  final String name;
  bool isCheck;

  TodoTask({required this.name, required this.isCheck});

  void taskDone() {
    isCheck = !isCheck;
  }
}
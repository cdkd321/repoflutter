import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isCheck;
  final String title;
  final Function onChecked;
  final GestureLongPressCallback? onItemLongPress;

  const TaskTile({
    super.key, required this.isCheck,
    required this.title, required this.onChecked,
    required this.onItemLongPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title, style: TextStyle(
        decoration: isCheck ? TextDecoration.lineThrough: null)),
        onLongPress: onItemLongPress,
        trailing: TaskCheckBox(isChecked: isCheck,
        onTagChanged: onChecked
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function onTagChanged;

  TaskCheckBox({required this.isChecked, required this.onTagChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (flag)=>onTagChanged());
  }
}

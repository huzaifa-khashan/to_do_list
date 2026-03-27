import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/components/task.form.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TaskForm();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}

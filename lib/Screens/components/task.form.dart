import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/providers/task_providers.dart';

class TaskForm extends StatelessWidget {
  // const TaskForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final taskTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40.0,
            top: -40.0,
            child: CircleAvatar(child: Icon(Icons.close, color: Colors.red)),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: taskTitle,
                    decoration: InputDecoration(hintText: "إضافة مهمة جديدة"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        context.read<TaskProviders>().addTask(
                          Task(title: taskTitle.text, completed: false,id:DateTime.now().toString(),
),
                        );
                      }
                    },
                    child: Text("Add Task"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

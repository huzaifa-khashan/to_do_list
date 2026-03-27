import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_providers.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskProvider = context.watch<TaskProviders>();
    return Expanded(
      flex: 5,
      child: ListView.builder(
        itemCount: TaskProvider.tasks.length,
        itemBuilder: (context, index) {
          return Container(
            child: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                TaskProvider.removeTask(TaskProvider.tasks[index]);
              },
              key: Key(TaskProvider.tasks[index].id),
              background: Container(
                padding: EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Icon(Icons.delete, size: 40),
              ),
              child: ListTile(
                title: Text(TaskProvider.tasks[index].title),
                trailing: Image(
                  image: TaskProvider.tasks[index].completed
                      ? AssetImage("assets/icons/emoji4.webp")
                      : AssetImage("assets/icons/emoji3.webp"),
                ),
                onTap: () {
                  TaskProvider.makeTaskCompleated(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

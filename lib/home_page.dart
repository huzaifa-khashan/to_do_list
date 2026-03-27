import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Screens/components/app_drawer.dart';
import 'package:to_do_list/Screens/components/body.dart';
import 'package:to_do_list/providers/task_providers.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("قائمتي")),
        actions: [
          PopupMenuButton<Filter>(
  onSelected: (value) {
    context.read<TaskProviders>().changeFilter(value);
  },
  itemBuilder: (context) => [
    PopupMenuItem(
      value: Filter.completed,
      child: Text("المهمات المنجزة"),
    ),
    PopupMenuItem(
      value: Filter.notCompleted,
      child: Text("المهمات غير المنجزة"),
    ),
    PopupMenuItem(
      value: Filter.all,
      child: Text("جميع المهمات"),
    ),
  ],
)
        ],
      backgroundColor: Colors.blue,
      ),
      body: Body(),
      drawer: AppDrawer(),
    );
  }
}

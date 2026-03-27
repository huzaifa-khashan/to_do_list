import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
enum Filter { all, completed, notCompleted }

class TaskProviders extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: "المهمة الأولى",
      completed: false,
      id: DateTime.now().toString(),
    ),
    Task(
      title: "المهمة الثانية",
      completed: false,
      id: DateTime.now().toString(),
    ),
    Task(
      title: "المهمة الثالثة",
      completed: false,
      id: DateTime.now().toString(),
    ),
  ];

  Filter _filter = Filter.all;

  void changeFilter(Filter newFilter) {
    _filter = newFilter;
    notifyListeners();
  }
bool _isDarkMode = false;

bool get isDarkMode => _isDarkMode;

void toggleTheme() {
  _isDarkMode = !_isDarkMode;
  notifyListeners();
}

void clearAllTasks() {
  _tasks.clear();
  notifyListeners();
}
  List<Task> get tasks {
    if (_filter == Filter.completed) {
      return _tasks.where((task) => task.completed).toList();
    } else if (_filter == Filter.notCompleted) {
      return _tasks.where((task) => !task.completed).toList();
    }
    return _tasks;
  }

  void addTask(task) {
    _tasks.add(task);
      saveTasks();

    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
      saveTasks();

    notifyListeners();
  }

  void makeTaskCompleated(index) {
    _tasks[index].completed = !_tasks[index].completed;
      saveTasks();

    notifyListeners();
  }



  Future<void> saveTasks() async {
  final prefs = await SharedPreferences.getInstance();

  List<String> tasksJson =
      _tasks.map((task) => jsonEncode(task.toJson())).toList();

  prefs.setStringList('tasks', tasksJson);
}


Future<void> loadTasks() async {
  final prefs = await SharedPreferences.getInstance();

  List<String>? tasksJson = prefs.getStringList('tasks');

  if (tasksJson != null) {
    _tasks.clear();
    _tasks.addAll(
      tasksJson.map((task) => Task.fromJson(jsonDecode(task))).toList(),
    );
    notifyListeners();
  }
}




}

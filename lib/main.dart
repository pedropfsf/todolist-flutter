import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/tasks/list_task_screen.dart';
import 'package:todolist/screens/tasks/record_task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(const App());

class AppState extends State<App> {
  String searchValue = '';
  List<Map> tasks = [];
  List<Map> filteredTasks = [];
  Map currentEditingTask = {};

  void clearCurrentEditingTask() {
    setState(() {
      currentEditingTask = {};
    });
  }

  void addTask(Map newTask) {
    clearCurrentEditingTask();

    setState(() {
      tasks.add(newTask);
      filteredTasks = tasks;
    });

    saveTasksOnDevice();
  }

  void editTask(Map newTask) {
    final newTasks = tasks.map((task) {
      if (task['id'] == newTask['id']) {
        return newTask;
      }

      return task;
    });

    setState(() {
      tasks = newTasks.toList();

      filteredTasks = tasks;
    });

    currentEditingTask.clear();
    saveTasksOnDevice();
  }

  String getTitle(Map item) {
    return item['title'].toString();
  }

  String getDescription(Map item) {
    return item['description'].toString();
  }

  void getStorageTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dynamic tasksStorage = json.decode(prefs.getString('tasks')!);

    tasks = [...tasksStorage];

    setState(() {
      filteredTasks = tasks;
    });
  }

  void saveTasksOnDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json.encode(tasks));
  }

  void changeSearchValue(String value) {
    final newFilteredTasks = tasks.where((item) {
      if (value.isEmpty) {
        return true;
      }

      final formattedValue = value.toLowerCase();

      final title = getTitle(item).toLowerCase();
      final description = getDescription(item);
      return title.contains(formattedValue) ||
          description.contains(formattedValue);
    });

    setState(() {
      filteredTasks = newFilteredTasks.toList();
    });
  }

  void toMark(int index, bool checked) {
    final item = tasks.elementAt(index);
    setState(() {
      item['checked'] = checked;
    });
    saveTasksOnDevice();
  }

  void goToEditTask(context, index) {
    final item = {...tasks.elementAt(index)};

    setState(() {
      currentEditingTask = item;
    });
  }

  void deleteTask(String id) {
    tasks.removeWhere((item) {
      final itemId = item['id'].toString();

      return itemId == id;
    });

    setState(() {
      filteredTasks = tasks;
    });
    saveTasksOnDevice();
  }

  @override
  void initState() {
    super.initState();

    getStorageTasks();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        '/': (listTaskContext) => ListTaskScreen(
              tasks: filteredTasks,
              toMark: toMark,
              searchValue: searchValue,
              changeSearchValue: changeSearchValue,
              deleteTask: deleteTask,
              goToEditTask: (index) => goToEditTask(context, index),
            ),
        '/task': (recordTaskContext) => RecordTaskScreen(
            record: currentEditingTask,
            addTask: addTask,
            editTask: editTask,
            clearCurrentEditingTask: clearCurrentEditingTask),
      },
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

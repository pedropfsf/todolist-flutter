import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/tasks/list_task_screen.dart';
import 'package:todolist/screens/tasks/record_task_screen.dart';

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
  }

  String getTitle(Map item) {
    return item['title'].toString();
  }

  String getDescription(Map item) {
    return item['description'].toString();
  }

  void changeSearchValue(String value) {
    final newFilteredTasks = tasks.where((item) {
      if (value.isEmpty) {
        return true;
      }

      final title = getTitle(item);
      final description = getDescription(item);
      return title.contains(value) || description.contains(value);
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
  }

  void goToEditTask(context, index) {
    final item = {...tasks.elementAt(index)};

    setState(() {
      currentEditingTask = item;
    });
  }

  void deleteTask(String id) {
    final newTasks = [
      ...tasks,
    ];

    tasks = newTasks.skipWhile((item) {
      return item['id'] == id;
    }).toList();

    setState(() {
      filteredTasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(theme: ThemeData.dark(), routes: {
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
    });
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

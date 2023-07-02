import 'package:flutter/material.dart';
import 'package:todolist/screens/tasks/list_task_screen.dart';
import 'package:todolist/screens/tasks/record_task_screen.dart';

main() => runApp(const App());
class AppState extends State<App> {
  List<Map> tasks = [];

  void changeTasks({String title = '', String description = '', bool checked = false}) {
    setState(() {
      tasks.add({
        'title': title,
        'description': description,
        'checked': checked
      });
    });
  }

  void toMark(int index, bool checked) {
    final item = tasks.elementAt(index);

    setState(() {
      item['checked'] = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        '/': (listTaskContext) => ListTaskScreen(tasks: tasks, toMark: toMark), 
        '/task': (recordTaskContext) => RecordTaskScreen(tasks: tasks, changeTasks: changeTasks), 
      }
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}
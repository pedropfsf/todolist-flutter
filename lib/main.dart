import 'package:flutter/material.dart';
import 'package:todolist/screens/tasks/list_task_screen.dart';
import 'package:todolist/screens/tasks/record_task_screen.dart';

main() => runApp(const App());
class AppState extends State<App> {
  String title = '';
  String description = '';
  bool checked = false;

  Function(dynamic) setRecord(dynamic key) {
    return (value) {
      debugPrint(value.toString());
      setState(() {
        key = value;
      });
    };
  }

  void save() {
    debugPrint('save');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        '/': (listTaskContext) => const ListTaskScreen(), 
        '/task': (recordTaskContext) => const RecordTaskScreen(), 
      }
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}
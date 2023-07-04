import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/tasks/list_task_screen.dart';
import 'package:todolist/screens/tasks/record_task_screen.dart';

main() => runApp(const App());

class AppState extends State<App> {
  List<Map> tasks = [];
  List<Map> filteredTasks = [];
  String searchValue = '';

  void changeSearchValue(String value) {
    final newFilteredTasks = tasks.where((item) {
      if (value.isEmpty) {
        return true;
      }

      final title = item['title'].toString();

      return title.contains(value);
    });

    setState(() {
      filteredTasks = newFilteredTasks.toList();
    });
  }

  void changeTasks({
    String title = '',
    String description = '',
    bool checked = false,
  }) {
    setState(() {
      tasks.add(
        {'title': title, 'description': description, 'checked': checked},
      );

      filteredTasks = tasks;
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(theme: ThemeData.dark(), routes: {
      '/': (listTaskContext) => ListTaskScreen(
            tasks: filteredTasks,
            toMark: toMark,
            searchValue: searchValue,
            changeSearchValue: changeSearchValue,
          ),
      '/task': (recordTaskContext) =>
          RecordTaskScreen(tasks: filteredTasks, changeTasks: changeTasks),
    });
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

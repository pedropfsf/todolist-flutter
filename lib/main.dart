import 'package:flutter/material.dart';
import 'package:todolist/widgets/form_task.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';


main() => runApp(const MaterialApp(
  home: App()
));

class AppState extends State<App> {
  Map record = {
    'title': '',
    'description': '',
    'checked': false,
  };

  Function(dynamic) setRecord(String key) {
    return (value) {
      setState(() {
        record[key] = value;
      });
    };
  }

  dynamic addTask(context) {
    debugPrint(record['checked']);

    return () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormTask(
            changeTitle: setRecord('title'),
            changeDescription: setRecord('description'),
            valueCheck: record['checked'],
            changeCheck: setRecord('checked'),
          );
        }
      );
    };
  }


  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      children: [
        Header(
          addTask: addTask(context),
        ),
      ] 
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}
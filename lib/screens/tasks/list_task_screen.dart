import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreenState extends State<ListTaskScreen> {
  Function() clickAdd(context) {
    return () {
      Navigator.pushNamed(context, '/task');
    };
  }

  void getTasks() async {
    final prefs = await SharedPreferences.getInstance();

    for(final key in prefs.getKeys()) {
      final contextSymbol = key.split(':')[0];
      final keySymbol = key.split(':')[0];
      
      if (contextSymbol == 'save_task') {
        debugPrint(keySymbol);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getTasks();
    return ScreenContainer(
      children: [
        Header(
          clickAdd: clickAdd(context),
        ),
      ] 
    );
  }
}

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({ super.key });

  @override
  State<ListTaskScreen> createState() => ListTaskScreenState();
}
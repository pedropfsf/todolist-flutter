import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreenState extends State<ListTaskScreen> {
  Function() clickAdd(context) {
    return () {
      Navigator.pushNamed(context, '/task');
    };
  }

  @override
  Widget build(BuildContext context) {
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
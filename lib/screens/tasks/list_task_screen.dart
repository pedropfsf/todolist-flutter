import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({ 
    super.key,
    required this.tasks,
  });

  final List<Map> tasks;


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
        Container(
          color: Colors.black26,
          height: 200,
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Text(tasks.elementAt(index)['title'], style: const TextStyle(color: Colors.white));
            },
          )
        )
      ] 
    );
  }
}
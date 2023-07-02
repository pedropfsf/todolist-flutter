import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({ 
    super.key,
    required this.tasks,
    required this.toMark,
  });

  final List<Map> tasks;
  final Function(int index, bool checked) toMark;


  Function() clickAdd(context) {
    return () {
      Navigator.pushNamed(context, '/task');
    };
  }

  dynamic getKeyByTasks(int index, String key) {
    return tasks.elementAt(index)[key];
  }

  @override
  Widget build(BuildContext context) {

    return ScreenContainer(
      children: [
        Header(
          clickAdd: clickAdd(context),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              
              final title = getKeyByTasks(index, 'title');
              final checked = getKeyByTasks(index, 'checked');

              return ListTile(
                leading: Checkbox(
                  value: checked,
                  onChanged: (value) {
                    toMark(index, value!);
                  },
                ),
                title: Text(title, style: const TextStyle(fontSize: 24)),
                dense: true,
              );
            },
          )
        )
      ] 
    );
  }
}
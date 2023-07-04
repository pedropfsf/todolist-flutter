import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({
    super.key,
    required this.tasks,
    required this.toMark,
    required this.searchValue,
    required this.changeSearchValue,
  });

  final String searchValue;
  final List<Map> tasks;
  final Function(int index, bool checked) toMark;
  final Function(String value) changeSearchValue;

  void clickAdd(context) {
    Navigator.pushNamed(context, '/task');
  }

  getKeyByTasks(int index, String key) {
    return tasks.elementAt(index)[key];
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(children: [
      Header(
        clickAdd: () => clickAdd(context),
        onInputChanged: changeSearchValue,
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
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            dense: true,
            // trailing: const Row(
            //   children: [
            //     IconButton(
            //       icon: Icon(
            //         Icons.delete,
            //         color: Colors.red,
            //       ),
            //       onPressed:
            //     )
            //   ],
            // )
          );
        },
      ))
    ]);
  }
}

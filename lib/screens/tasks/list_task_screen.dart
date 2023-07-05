import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/icons/icon_button_delete.dart';
import 'package:todolist/widgets/icons/icon_button_edit.dart';
import 'package:todolist/widgets/screen_container.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({
    super.key,
    required this.tasks,
    required this.toMark,
    required this.searchValue,
    required this.changeSearchValue,
    required this.deleteTask,
    required this.goToEditTask,
  });

  final String searchValue;
  final List<Map> tasks;
  final Function(int index, bool checked) toMark;
  final Function(String value) changeSearchValue;
  final Function(String id) deleteTask;
  final Function(dynamic index) goToEditTask;

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
          final id = getKeyByTasks(index, 'id');
          final title = getKeyByTasks(index, 'title');
          final description = getKeyByTasks(index, 'description');
          final checked = getKeyByTasks(index, 'checked');

          return ListTile(
            leading: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: checked,
                  onChanged: (value) {
                    toMark(index, value!);
                  },
                )),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            dense: true,
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButtonEdit(
                    onPressed: () {
                      goToEditTask(index);
                      Navigator.pushNamed(context, '/task');
                    },
                  ),
                  IconButtonDelete(
                    onPressed: () => deleteTask(id),
                  ),
                ],
              ),
            ),
          );
        },
      ))
    ]);
  }
}

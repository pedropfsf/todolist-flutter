import 'package:flutter/material.dart';
import 'package:todolist/services/text.dart';
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

  void showDetails(context, title, description, checked) {
    final affirmation = checked ? 'Sim' : 'Não';

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                ),
                const SizedBox(height: 16),
                Text('Marcado: $affirmation'),
              ],
            ),
          ),
        );
      },
    );
  }

  getKeyByTasks(int index, String key) {
    return tasks.elementAt(index)[key];
  }

  Widget? getSubtitle(String description) {
    if (description.isNotEmpty) {
      return Text(
        limitCharacters(value: description),
        style: const TextStyle(
          fontSize: 16,
        ),
      );
    }

    return null;
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
            onLongPress: () =>
                showDetails(context, title, description, checked),
            leading: Transform.scale(
                scale: 1.4,
                child: Checkbox(
                  value: checked,
                  onChanged: (value) {
                    toMark(index, value!);
                  },
                )),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: getSubtitle(description),
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

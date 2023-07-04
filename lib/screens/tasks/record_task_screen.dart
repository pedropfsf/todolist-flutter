import 'package:flutter/material.dart';
import 'package:todolist/widgets/checkbox_label.dart';
import 'package:todolist/widgets/elevated_button_custom.dart';
import 'package:todolist/widgets/field.dart';
import 'package:todolist/widgets/screen_container.dart';
import 'package:todolist/widgets/text_button_custom.dart';
import 'package:todolist/widgets/title_form.dart';

class RecordTaskScreenState extends State<RecordTaskScreen> {
  String title = '';
  String description = '';
  bool checked = false;

  void changeTitle(String value) {
    setState(() {
      title = value;
    });
  }

  void changeDescription(String value) {
    setState(() {
      description = value;
    });
  }

  void changeChecked(bool? value) {
    setState(() {
      checked = value!;
    });
  }

  Function() goToBack(context) {
    return () => Navigator.pop(context);
  }

  Function() save(context) {
    return () async {
      try {
        if (_formKey.currentState!.validate()) {
          widget.changeTasks(
            title: title,
            description: description,
            checked: checked,
          );

          goToBack(context)();
        }
      } catch (error) {
        debugPrint(error.toString());
      }
    };
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: ScreenContainer(children: [
          const TitleForm(title: 'Registro de tarefa'),
          const SizedBox(height: 24),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
              key: _formKey,
              child: Column(children: [
                Field(
                  label: 'Título',
                  change: changeTitle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Preencha o campo';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Field(
                  label: 'Descrição',
                  change: changeDescription,
                ),
                CheckboxLabel(
                  label: 'Marcado',
                  checked: checked,
                  change: changeChecked,
                )
              ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButtonCustom(label: 'Voltar', onPressed: goToBack(context)),
              const SizedBox(width: 24),
              ElevatedButtonCustom(label: 'Salvar', onPressed: save(context))
            ])
          ])
        ]));
  }
}

class RecordTaskScreen extends StatefulWidget {
  const RecordTaskScreen({
    super.key,
    required this.tasks,
    required this.changeTasks,
  });

  final List<Map> tasks;
  final Function({String title, String description, bool checked}) changeTasks;

  @override
  State<RecordTaskScreen> createState() => RecordTaskScreenState();
}

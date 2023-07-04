import 'package:flutter/material.dart';
import 'package:todolist/widgets/checkbox_label.dart';
import 'package:todolist/widgets/elevated_button_custom.dart';
import 'package:todolist/widgets/field.dart';
import 'package:todolist/widgets/screen_container.dart';
import 'package:todolist/widgets/text_button_custom.dart';
import 'package:todolist/widgets/title_form.dart';
import 'package:uuid/uuid.dart';

class RecordTaskScreenState extends State<RecordTaskScreen> {
  String title = '';
  String description = '';
  bool checked = false;
  final _formKey = GlobalKey<FormState>();
  final uuid = const Uuid();

  bool isValidForm() {
    return _formKey.currentState!.validate();
  }

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

  void goToBack(context) {
    Navigator.pop(context);
  }

  void save(context) {
    try {
      debugPrint('a');
      if (isValidForm()) {
        setState(() {
          widget.addTask(
            {
              'id': uuid.v4().toString(),
              'title': title,
              'description': description,
              'checked': checked,
            },
          );
        });

        goToBack(context);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  String? validateTitleField(value) {
    if (value!.isEmpty) {
      return 'Preencha o campo';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ScreenContainer(
        children: [
          const TitleForm(title: 'Registro de tarefa'),
          const SizedBox(height: 24),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
              key: _formKey,
              child: Column(children: [
                Field(
                  label: 'Título',
                  change: changeTitle,
                  validator: validateTitleField,
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
              TextButtonCustom(
                label: 'Voltar',
                onPressed: () => goToBack(context),
              ),
              const SizedBox(width: 24),
              ElevatedButtonCustom(
                label: 'Salvar',
                onPressed: () => save(context),
              )
            ])
          ])
        ],
      ),
    );
  }
}

class RecordTaskScreen extends StatefulWidget {
  const RecordTaskScreen({
    super.key,
    required this.addTask,
  });

  final Function(Map) addTask;

  @override
  State<RecordTaskScreen> createState() => RecordTaskScreenState();
}

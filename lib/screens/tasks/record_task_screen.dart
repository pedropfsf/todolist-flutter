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
  
  void changeCheck(bool? value) {
    setState(() {
      checked = value!;
    });
  }

  Function() goToBack(context) {
    return () => Navigator.pop(context);
  }

  void save() {
    debugPrint('save');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      children: [
        const TitleForm(title: 'Registro de tarefa'),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Field(
                  label: 'Título', 
                  change: changeTitle,
                ),
                const SizedBox(height: 16),
                Field(
                  label: 'Descrição', 
                  change: changeDescription,
                ),
                CheckboxLabel(
                  label: 'Marcado',
                  checked: checked, 
                  change: changeCheck, 
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonCustom(
                  label: 'Voltar', 
                  onPressed: goToBack(context)
                ),
                const SizedBox(width: 24),
                ElevatedButtonCustom(
                  label: 'Salvar', 
                  onPressed: save
                )
              ]
            )
          ]
        )
      ]
    );
  }
}

class RecordTaskScreen extends StatefulWidget {
  const RecordTaskScreen({super.key});

  @override 
  State<RecordTaskScreen> createState() => RecordTaskScreenState();
}
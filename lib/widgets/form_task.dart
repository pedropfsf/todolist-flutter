import 'package:flutter/material.dart';

class FormTask extends StatelessWidget {
  const FormTask({
    super.key,
    required this.changeTitle,
    required this.changeDescription,
    required this.valueCheck,
    required this.changeCheck,
  });

  final void Function(String) changeTitle;
  final void Function(String) changeDescription;
  final bool valueCheck;
  final void Function(bool) changeCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Registro de tarefa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Título',
                  ),
                  onSubmitted: changeTitle,
                )
              ),
              
            ],
          ),
          const SizedBox(height: 16),
          TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
              maxLines: 2,
              onSubmitted: changeDescription,
            ),
          // const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: valueCheck,
                onChanged: (value) {
                  changeCheck(value!);
                },
              ),
              const Text('Marcado')
            ]
          )
        ]
      )
    );
  }
}
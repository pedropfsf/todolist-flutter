import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key, required this.clickAdd, required this.onInputChanged});

  final Function() clickAdd;
  final Function(String) onInputChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 24,
        ),
        child: Row(children: [
          Expanded(
              child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pesquisar tarefa',
            ),
            onChanged: onInputChanged,
          )),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            iconSize: 48,
            tooltip: 'Adicionar tarefa',
            onPressed: clickAdd,
          )
        ]));
  }
}

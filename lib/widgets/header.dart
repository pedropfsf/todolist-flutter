import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.clickAdd
  });

  final Function() clickAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pesquisar tarefa',
            ),
          )
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
          ),
          iconSize: 48,
          tooltip: 'Adicionar tarefa',
          onPressed: clickAdd,
        )
      ]
    );
  }
}
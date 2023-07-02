import 'package:flutter/material.dart';
import 'package:todolist/services/view.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.clickAdd
  });

  final Function() clickAdd;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = getHeightStatusBar(context);

    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight + 24,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Row(
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
      )
    );
  }
}
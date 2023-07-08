import 'package:flutter/material.dart';

class IconButtonDelete extends StatelessWidget {
  const IconButtonDelete({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 32,
      ),
      onPressed: onPressed,
    );
  }
}

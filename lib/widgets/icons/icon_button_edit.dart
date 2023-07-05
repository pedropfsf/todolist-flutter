import 'package:flutter/material.dart';

class IconButtonEdit extends StatelessWidget {
  const IconButtonEdit({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: Colors.orange,
        size: 32,
      ),
      onPressed: onPressed,
    );
  }
}

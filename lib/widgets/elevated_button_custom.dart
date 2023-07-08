import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
    super.key,
    required this.onPressed,
    required this.label,
  });
  
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label,
        style: const TextStyle(
          fontSize: 24,
        )
      ),
    );
  }
}
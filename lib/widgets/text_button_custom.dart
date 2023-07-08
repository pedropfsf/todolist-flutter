import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({
    super.key,
    required this.onPressed,
    required this.label,
  });
  
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 24)),
      ),
      child: Text(label,
        style: const TextStyle(
          fontSize: 24,
        )
      ),
    );
  }
}
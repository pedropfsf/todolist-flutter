import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {
  const TitleForm({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }
}
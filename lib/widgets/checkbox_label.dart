import 'package:flutter/material.dart';

class CheckboxLabel extends StatelessWidget {
  const CheckboxLabel({
    super.key,
    required this.checked,
    required this.change,
    required this.label, 
  });

  final bool checked;
  final Function(bool?) change;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: checked,
          onChanged: change,
        ),
        Text(label)
      ]
    );
  }
}
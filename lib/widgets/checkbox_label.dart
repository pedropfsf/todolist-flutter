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
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Transform.scale(
        scale: 1.2,
        child: Checkbox(
          value: checked,
          onChanged: change,
        ),
      ),
      Text(label)
    ]);
  }
}

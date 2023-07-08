import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.label,
    required this.change,
    this.validator,
    this.initialValue,
    this.maxLines,
  });

  final String label;
  final String? initialValue;
  final Function(String) change;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        alignLabelWithHint: true,
      ),
      onChanged: change,
      initialValue: initialValue,
      maxLines: maxLines,
    ));
  }
}

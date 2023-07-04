import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.label,
    required this.change,
    this.validator,
    this.initialValue,
  });

  final String label;
  final String? initialValue;
  final Function(String) change;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: change,
      initialValue: initialValue,
    ));
  }
}

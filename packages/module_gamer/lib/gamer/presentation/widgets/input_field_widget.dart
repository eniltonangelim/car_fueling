import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.size,
    required this.hintText,
    required this.onEditingComplete,
    required this.controller,
  });

  final double size;
  final String hintText;
  final Function(String) onEditingComplete;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColorLight,
        onEditingComplete: () => onEditingComplete(controller.value.text),
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
        ),
        validator: (value) {
          const alpha = r"[a-zA-Z]";
          if (value == null || value.isEmpty || RegExp(alpha).hasMatch(value)) {
            return "Please enter some text";
          }
          return null;
        },
      ),
    );
  }
}

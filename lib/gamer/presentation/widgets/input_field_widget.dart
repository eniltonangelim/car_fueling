
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({super.key, required this.size, required this.hintText});

  final double size;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextField(
        cursorColor: Theme.of(context).primaryColorLight,
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

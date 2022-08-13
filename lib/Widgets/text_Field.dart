import 'package:flutter/material.dart';

class TextfeildInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hinttext;
  final TextInputType textInputType;
  const TextfeildInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hinttext,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hinttext,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

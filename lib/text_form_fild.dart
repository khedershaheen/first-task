import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  CustomTextFormFild(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.icon,
      required this.keybordtype});
  String hintText;
  String lableText;
  final Icon? icon;
  TextInputType keybordtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 211, 207, 207)),
      child: TextFormField(
        keyboardType: keybordtype,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: icon,
          label: Text(lableText),
          labelStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

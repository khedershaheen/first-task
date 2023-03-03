import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  CustomTextFormFild(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.icon,
      required this.keybordtype,
      required this.obscure,
      required this.controller,
      this.validator,
      this.suffIcon});
  String hintText;
  String lableText;
  final Icon? icon;
  TextInputType keybordtype;
  bool obscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconButton? suffIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 211, 207, 207)),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        keyboardType: keybordtype,
        decoration: InputDecoration(
          suffixIcon: suffIcon,
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

import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.obscureText,
      this.icon,
      required this.controller,
      required this.fieldname});
  final String hintText;
  final bool obscureText;
  final IconButton? icon;
  final TextEditingController controller;
  final String fieldname;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (controller.text.isEmpty) {
          return "$fieldname is Required";
        }
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: const Color(0xffE9E9E9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: hintText,
        suffixIcon: icon,
      ),
    );
  }
}

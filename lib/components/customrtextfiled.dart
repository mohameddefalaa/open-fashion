import 'package:flutter/material.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';

class CustomTextfailed extends StatelessWidget {
  const CustomTextfailed({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.typee,
  });
  final TextEditingController controller;
  final String hint, label;
  final TextInputType typee;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'sorry $hint must be required ';
        } else {
          return null;
        }
      },
      keyboardType: typee,
      cursorColor: Lightthemcolors.sbbcolor,
      cursorHeight: 15,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 167, 163, 163)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD4D4D4)),
        ),
        hintText: hint,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontSize: 15),
        labelStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontSize: 15),
        labelText: label,
      ),
    );
  }
}

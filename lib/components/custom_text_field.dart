import 'dart:core';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  Function(String) onChange;
  Function(String) onSubmitted;
  String? initialText;
  String? hintText;
  String? labelText;
  bool? onClick;
  Icon? icon;
  bool? enable;

  CustomTextField(
      {super.key,
      required this.onSubmitted,
      this.initialText,
      this.enable,
      this.icon,
      this.hintText,
      this.labelText,
      required this.onChange,
      this.onClick});
  bool onView = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      initialValue: initialText,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          hintStyle: (TextStyle(color: Colors.black.withOpacity(.5))),
          labelText: labelText,
          labelStyle: (const TextStyle(color: Colors.black, fontSize: 18)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          )),
    );
  }
}

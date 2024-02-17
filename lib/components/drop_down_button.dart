import 'package:flutter/material.dart';

import '../services/all_categories.dart';
import 'custom_operator_drop_down.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  CustomDropDownButton(this.onChange, {super.key});
  Function(String) onChange;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  List<dynamic>? list;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AllCategories().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          list = snapshot.data;

          return CustomOperatorDropDown(
            list ?? [],
            (data) {
              widget.onChange(data);
            },
          );
        } else {
          return const Text("Loading....");
        }
      },
    );
  }
}

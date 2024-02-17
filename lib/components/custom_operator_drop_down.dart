import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomOperatorDropDown extends StatefulWidget {
  CustomOperatorDropDown(this.list, this.onChanged, {super.key});

  List<dynamic> list;

  Function(dynamic) onChanged;
  @override
  State<CustomOperatorDropDown> createState() => _CustomOperatorDropDownState();
}

class _CustomOperatorDropDownState extends State<CustomOperatorDropDown> {
  String? dropdownValue;
  bool? valuer;
  List<dynamic> list1 = [];

  @override
  Widget build(BuildContext context) {
    if (valuer == null) {
      list1 = [];
      list1.add("All");
      dropdownValue = list1.first;
      for (int i = 0; i < widget.list.length; i++) {
        list1.add(widget.list[i]);
      }
    }

    // TODO: implement build
    return DropdownButton<dynamic>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (dynamic value) {
        // This is called when the user selects an item.
        setState(() {
          valuer = true;

          dropdownValue = value!;
        });
        widget.onChanged(value);
      },
      items: list1.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

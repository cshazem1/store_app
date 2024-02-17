import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({
    super.key,
  });

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36,
        child: IconButton(
            color: Colors.blue,
            onPressed: () {
              setState(() {});
              favorite = !favorite;
            },
            icon: Icon(
              Icons.favorite,
              color: favorite ? Colors.red : Colors.white,
              size: 30,
            )));
  }
}

import 'package:flutter/material.dart';

class MyTextFilde extends StatefulWidget {
  static bool sil = false;
  final String txt;
  final Function(String) onChanged;
  final int minLines;
  const MyTextFilde({
    super.key,
    required this.txt,
    required this.onChanged,
    required this.minLines,
  });

  @override
  State<MyTextFilde> createState() => _MyTextFildeState();
}

class _MyTextFildeState extends State<MyTextFilde> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (MyTextFilde.sil == true) {
      controller.clear();
    }
    return TextField(
      controller: controller,
      minLines: widget.minLines,
      maxLines: null,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        //fillColor: Colors.grey,
        hoverColor: Colors.white70,
        filled: true,
        hintText: widget.txt,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

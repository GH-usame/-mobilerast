import 'package:flutter/material.dart';

Widget myCombobox({
  Function(String)? onItemSelected,
  required String? hint,
}) {
  String selectedValue = ''; // Seçilen değeri saklamak için bir değişken
  const List<String> list = <String>['Backlog', 'To Do', 'In Progress', 'Done'];
  return DropdownButtonFormField(
    decoration: InputDecoration(
      label: Text(hint!),
      hintText: hint,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
    //value: list.first,
    onChanged: (v) {
      selectedValue = v!;
      if (selectedValue != "") {
        onItemSelected!(v);
      }
    },
    items: list.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
  );
}

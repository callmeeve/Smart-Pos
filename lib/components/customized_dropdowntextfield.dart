import 'package:flutter/material.dart';

class CustomizedDropdownTextField extends StatefulWidget {
  const CustomizedDropdownTextField({Key? key}) : super(key: key);

  @override
  _CustomizedDropdownTextFieldState createState() =>
      _CustomizedDropdownTextFieldState();
}

class _CustomizedDropdownTextFieldState
    extends State<CustomizedDropdownTextField> {
  final List<String> items = [
    "Penambahan",
    "Pengurangan",
  ];
  String selectedItem = 'Penambahan';

  void onChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedItem = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          fillColor: const Color(0xffE8ECF4),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}

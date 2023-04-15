import 'package:flutter/material.dart';

class CustomizedTextfield extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  const CustomizedTextfield(
      {Key? key, required this.myController, this.hintText, this.isPassword})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomizedTextfieldState createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: widget.isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: widget.isPassword! ? false : true,
        autocorrect: widget.isPassword! ? false : true,
        obscureText: _showPassword ? false : widget.isPassword ?? true,
        controller: widget.myController,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _showPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          fillColor: const Color(0xffE8ECF4),
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

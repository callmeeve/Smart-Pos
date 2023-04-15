import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const CustomizedButton(
      {super.key,
      this.buttonText,
      this.textColor,
      this.buttonColor,
      this.borderColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: buttonColor!,
            border: Border.all(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonText!,
              style: TextStyle(
                color: textColor!,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

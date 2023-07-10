import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const CustomizedButton({
    Key? key,
    this.buttonText,
    this.textColor,
    this.buttonColor,
    this.borderColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          side: BorderSide(
            width: 1,
            color: borderColor!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              buttonText!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

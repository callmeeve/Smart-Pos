import 'package:flutter/material.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/customized_textfield.dart';
import 'package:smartpos/theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _saveChanges() {
    // Password change logic goes here
    bool changeSuccess = true; // Replace with your own password change logic

    if (changeSuccess) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Password Changed'),
          content: const Text('Your password has been changed successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Ganti Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            CustomizedTextfield(
              myController: _passwordController,
              hintText: "Current Password",
              isPassword: true,
            ),
            CustomizedTextfield(
              myController: _newPasswordController,
              hintText: "New Password",
              isPassword: true,
            ),
            CustomizedTextfield(
              myController: _confirmPasswordController,
              hintText: "Confirm Password",
              isPassword: true,
            ),
            const SizedBox(height: 16.0),
            CustomizedButton(
              buttonText: "Save Changes",
              buttonColor: primaryBlue,
              textColor: Colors.white,
              borderColor: primaryBlue,
              onPressed: _saveChanges,
            ),
          ],
        ),
      ),
    );
  }
}

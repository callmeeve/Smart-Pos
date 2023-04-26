import 'package:flutter/material.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/customized_textfield.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/pages/loginpage.dart';
import 'package:smartpos/pages/verificationpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Hello! \nRegister to get Started",
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _usernameController,
                  hintText: "Username",
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _emailController,
                  hintText: "Email",
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _passwordController,
                  hintText: "Password",
                  isPassword: true,
                ),
                CustomizedTextfield(
                  myController: _confirmPasswordController,
                  hintText: "Confirm Password",
                  isPassword: true,
                ),
                CustomizedButton(
                  buttonText: "Register",
                  buttonColor: primaryBlue,
                  textColor: Colors.white,
                  borderColor: primaryBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                          phoneNumber: '+1234567890',
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.12,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "or Register with",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            UniconsLine.google,
                            // color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          " Login Now",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

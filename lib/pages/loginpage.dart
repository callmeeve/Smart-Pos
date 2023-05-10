import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/customized_textfield.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/pages/dashboardpage/dashboardbody.dart';
import 'package:smartpos/pages/registerpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _showDialog(bool isSuccess) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: isSuccess
  //             ? const Text('Login Success')
  //             : const Text('Login Failed'),
  //         content: isSuccess
  //             ? const Text('You have successfully logged in.')
  //             : const Text('Your email or password is incorrect.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('OK'),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // void login() async {
  //   try {
  //     final UserCredential userCredential =
  //         await _auth.signInWithEmailAndPassword(
  //       email: _emailController.value.text,
  //       password: _passwordController.value.text,
  //     );

  //     // If successful, navigate to next page
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => CashierPage(),
  //       ),
  //     );
  //     _showDialog(true);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       // Show error message using e.message
  //       if (kDebugMode) {
  //         print('No user found for that email.');
  //       }
  //     } else if (e.code == 'wrong-password') {
  //       // Show error message using e.message
  //       if (kDebugMode) {
  //         print('Wrong password provided for that user.');
  //       }
  //     }
  //     _showDialog(false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  "Welcome Back! \nGlad to see you again",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Enter your Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Enter your Password",
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Text("Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff6A707C),
                          fontSize: 15,
                        )),
                  ),
                ),
              ),
              CustomizedButton(
                buttonText: "Login",
                buttonColor: primaryBlue,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CashierPage(),
                    ),
                  );
                },
                // onPressed: login,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "or Login with",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.15,
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
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
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "  Register Now",
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
    );
  }
}

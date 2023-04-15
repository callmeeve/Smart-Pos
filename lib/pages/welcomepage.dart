import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/pages/loginpage.dart';
import 'package:smartpos/pages/registerpage.dart';
import 'package:smartpos/theme.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_9aaqrsgf.json',
              repeat: true,
              frameRate: FrameRate(60),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "Smart Pos",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ),
                Text(
                  "Manage your business \n transactions efficiently and \n easily in your hand",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: textBlack,
                    ),
                  ),
                ),
                const Spacer(),
                CustomizedButton(
                  buttonText: 'Login',
                  textColor: textWhiteGrey,
                  buttonColor: primaryBlue,
                  borderColor: primaryBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
                CustomizedButton(
                  buttonText: 'Register',
                  textColor: primaryBlue,
                  buttonColor: Colors.white,
                  borderColor: primaryBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               'assets/images/bg.png',
//               fit: BoxFit.fill,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     child: Text(
//                       'SMARTPOS',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: primaryBlue,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   const SizedBox(
//                     height: 300,
//                     width: 300,
//                     child: Image(
//                       image: AssetImage("assets/images/people.png"),
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   CustomizedButton(
//                     buttonText: 'Login',
//                     textColor: textWhiteGrey,
//                     buttonColor: primaryBlue,
//                     borderColor: primaryBlue,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginPage(),
//                         ),
//                       );
//                     },
//                   ),
//                   CustomizedButton(
//                     buttonText: 'Register',
//                     textColor: primaryBlue,
//                     buttonColor: Colors.white,
//                     borderColor: primaryBlue,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RegisterPage(),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

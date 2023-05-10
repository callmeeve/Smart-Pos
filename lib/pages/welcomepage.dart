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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                const SizedBox(height: 10),
                Text(
                  "Manage your business transactions efficiently and easily in your hand",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: textBlack,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
              ],
            ),
          ],
        ),
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

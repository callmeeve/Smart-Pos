import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartpos/pages/loginpage.dart';
import 'package:smartpos/pages/welcomepage.dart';
import 'package:smartpos/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: Center(
          child: Text(
            'Smart Pos',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // splash: Image.asset(
        //   "assets/images/logo.png",
        //   width: 300,
        //   height: 300,
        // ),
        nextScreen: const WelcomePage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.blue.shade900,
      ),
    );
  }
}

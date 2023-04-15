import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/theme.dart';

const String _paymentSuccessLottieUrl =
    'https://assets1.lottiefiles.com/packages/lf20_gaxn5gzy.json';
const String _Selesai = "Selesai";

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          primaryColor: primaryBlue,
        ),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: Lottie.network(
                    _paymentSuccessLottieUrl,
                    repeat: true,
                    frameRate: FrameRate(60),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Thank You!",
                  style: GoogleFonts.poppins(
                    color: textBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  "Payment done Successfully",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "You will be redirected to the home page shortly\nor click here to return to home page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CashierPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Center(
                      child: Text(
                        'Selesai',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
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

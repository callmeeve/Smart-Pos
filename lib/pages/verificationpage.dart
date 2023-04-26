import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/theme.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  VerificationScreen({required this.phoneNumber});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _verifyCode(String code) {
    // You can use this method to verify the code entered by the user
    // and navigate to the next screen if the code is correct
    print('Code entered: $code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primaryBlue),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'OTP',
          style: GoogleFonts.poppins(
            color: primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_zl2c0cuv.json',
                    repeat: true,
                    frameRate: FrameRate(60),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Verification Code",
                  style: GoogleFonts.poppins(
                    color: primaryBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Enter the verification code sent to ${widget.phoneNumber}',
                  style: GoogleFonts.poppins(
                    color: textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  textStyle: TextStyle(color: primaryBlue),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveColor: primaryBlue,
                    activeColor: primaryBlue,
                    selectedColor: primaryBlue,
                    errorBorderColor: Colors.red,
                    activeFillColor: Colors.white,
                  ),
                  controller: _textEditingController,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    _verifyCode(value);
                  },
                ),
                const SizedBox(height: 30.0),
                CustomizedButton(
                  buttonText: "Confirm",
                  buttonColor: primaryBlue,
                  textColor: Colors.white,
                  borderColor: primaryBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CashierPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

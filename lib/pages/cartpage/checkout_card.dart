import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/models/cart.dart';
import 'package:smartpos/pages/cartpage/payment_succesfull.dart';
import 'package:smartpos/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalCost = 0;
    for (var cart in demoCarts) {
      totalCost += cart.product.price * cart.numOfItem;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.receipt,
                    color: Colors.blue.shade900,
                    size: 20,
                  ),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total :\n",
                    children: [
                      TextSpan(
                        text: "Rp${totalCost.toInt()}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 190,
                  child: CustomizedButton(
                      buttonText: "Bayar",
                      buttonColor: Colors.blue.shade900,
                      textColor: Colors.white,
                      borderColor: Colors.transparent,
                      onPressed: () => _showPaymentOptions(context)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Define method for showing modal bottom sheet
  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Select Payment Amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryBlue),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessfulPage(),
                    ),
                  );
                },
                child: Text(
                  'Uang Pas',
                  style: TextStyle(
                    color: primaryBlue,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryBlue),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessfulPage(),
                    ),
                  );
                },
                child: Text(
                  'Rp10000',
                  style: TextStyle(
                    color: primaryBlue,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryBlue),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessfulPage(),
                    ),
                  );
                },
                child: Text(
                  'Rp50000',
                  style: TextStyle(
                    color: primaryBlue,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryBlue),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessfulPage(),
                    ),
                  );
                },
                child: Text(
                  'Rp100000',
                  style: TextStyle(
                    color: primaryBlue,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryBlue),
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        title: Text(
                          'Input Harga',
                          style: GoogleFonts.poppins(
                            color: primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: const TextField(
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: 'Masukkan harga'),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentSuccessfulPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Lainnya',
                  style: TextStyle(
                    color: primaryBlue,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

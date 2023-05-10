import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/pages/cartpage/cartbody.dart';
import 'package:smartpos/pages/cartpage/checkout_card.dart';
import 'package:smartpos/models/cart.dart';
import 'package:smartpos/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: primaryBlue,
      iconTheme: IconThemeData(
        color: textWhiteGrey,
      ),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "My Cart",
              style: GoogleFonts.poppins(
                color: textWhiteGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '${demoCarts.length} items',
            style: GoogleFonts.poppins(
              color: textWhiteGrey,
              height: 1,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

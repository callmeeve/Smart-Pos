import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/models/cart.dart';
import 'package:smartpos/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundColor: primaryBlue,
            backgroundImage: AssetImage(
              cart.product.image,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cart.product.title,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: textBlack,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'Rp${cart.product.price} x ${cart.numOfItem}',
                // 'Total : Rp${cart.product.price * cart.numOfItem}',
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'Total : Rp${cart.product.price * cart.numOfItem}',
                // 'Total : Rp${cart.product.price * cart.numOfItem}',
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

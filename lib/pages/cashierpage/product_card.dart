import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  // final Function(Product) onTap;
  const ProductCard({
    Key? key,
    required this.product,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(20));
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: borderRadius,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(36), // Image radius
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: textBlack,
                  ),
                ),
                Text(
                  'Rp${product.price}',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

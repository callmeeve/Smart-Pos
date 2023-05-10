import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/material.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class Promo {
  final String title;
  final Color firstcolor;
  final Color secondcolor;
  final String description;
  final String btnText;
  final String image;

  Promo({
    required this.title,
    required this.firstcolor,
    required this.secondcolor,
    required this.description,
    required this.btnText,
    required this.image,
  });
}

List<Promo> promos = [
  Promo(
    title: "New Year Sale",
    firstcolor: const Color(0xff6C59D4).withOpacity(0.9),
    secondcolor: const Color(0xff869DFB).withOpacity(0.7),
    description: "Buy 1 Get 1 Free on all items",
    btnText: "Get Now",
    image: "assets/images/coupon.png",
  ),
  Promo(
    title: "Christmas Sale",
    firstcolor: Colors.white,
    secondcolor: secondaryYellow,
    description: "Get 20% off on all items",
    btnText: "Get Now",
    image: "assets/images/discount.png",
  ),
];

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promo"),
        backgroundColor: primaryBlue,
      ),
      drawer: const SideBar(),
      body: ListView.builder(
        itemCount: promos.length,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: FlatBanners(
              imageWidth: 50,
              gradientColors: [
                promo.firstcolor,
                promo.secondcolor,
              ],
              title: promo.title,
              subtitle: promo.description,
              btnText: promo.btnText,
              image: promo.image,
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}

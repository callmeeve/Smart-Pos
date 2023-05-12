import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/material.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class Promo {
  final String title;
  final String description;
  final String btnText;
  final String image;

  Promo({
    required this.title,
    required this.description,
    required this.btnText,
    required this.image,
  });
}

List<Promo> promos = [
  Promo(
    title: "New Year Sale",
    description: "Buy 1 Get 1 Free on all items",
    btnText: "Get Now",
    image: "assets/images/coupon.png",
  ),
  Promo(
    title: "Christmas Sale",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: ListView.builder(
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
                  primaryBlue.withOpacity(0.9),
                  primaryBlue.withOpacity(0.7),
                ],
                title: promo.title,
                subtitle: promo.description,
                btnText: promo.btnText,
                actionBtnBgColor: secondaryYellow,
                image: promo.image,
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}

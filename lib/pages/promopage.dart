import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Promo",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

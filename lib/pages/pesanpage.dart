import 'package:flutter/material.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pesan",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

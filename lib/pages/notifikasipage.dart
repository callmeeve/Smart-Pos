import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Notifikasi",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

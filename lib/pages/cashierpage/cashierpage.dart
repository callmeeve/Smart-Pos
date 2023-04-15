import 'package:flutter/material.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/pages/cashierpage/cashierbody.dart';
import 'package:smartpos/pages/cartpage/cartpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class CashierPage extends StatelessWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryBlue,
        title: const Text('Smart Pos'),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(UniconsLine.shopping_cart),
          ),
        ],
      ),
      drawer: const SideBar(),
      body: const CashierBody(),
    );
  }
}

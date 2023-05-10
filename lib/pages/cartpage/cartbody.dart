import 'package:flutter/material.dart';
import 'package:smartpos/pages/cartpage/cart_card.dart';
import 'package:smartpos/models/cart.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: secondaryYellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Icon(
                    UniconsLine.trash,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            child: CartCard(
              cart: demoCarts[index],
            ),
          ),
        ),
      ),
    );
  }
}

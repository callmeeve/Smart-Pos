import 'package:flutter/material.dart';
import 'package:smartpos/components/categories.dart';
import 'package:smartpos/components/search_field.dart';
import 'package:smartpos/pages/cashierpage/product_card.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';

class CashierBody extends StatefulWidget {
  const CashierBody({Key? key}) : super(key: key);

  @override
  State<CashierBody> createState() => _CashierBodyState();
}

class _CashierBodyState extends State<CashierBody> {
  final List<Product> _products = products;
  late List<Product> _filteredProducts = _products;

  void onSearch(String value) {
    setState(() {
      _filteredProducts = _products.where((product) {
        final query = value.toLowerCase();
        final title = product.title.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  void onCategorySelected(int index) {
    setState(() {
      if (index == 0) {
        // All products
        _filteredProducts = products;
      } else if (index == 1) {
        // Coffee Based products
        _filteredProducts = products
            .where((product) => product.category == "Coffee Based")
            .toList();
      } else if (index == 2) {
        // Milk Based products
        _filteredProducts = products
            .where((product) => product.category == "Milk Based")
            .toList();
      } else if (index == 3) {
        // Fresh products
        _filteredProducts =
            products.where((product) => product.category == "Fresh").toList();
      } else if (index == 4) {
        // Signature products
        _filteredProducts = products
            .where((product) => product.category == "Signature")
            .toList();
      }
      print('Selected category index: $index');
      print('_filteredProducts length: ${_filteredProducts.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: SearchField(onChanged: onSearch),
        ),
        Categories(
          onCategorySelected: onCategorySelected,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) => ProductCard(
                product: _filteredProducts[index],
                // onTap: () => addToCart(products),
                // press: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

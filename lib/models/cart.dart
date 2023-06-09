import 'Product.dart';

class Cart {
  final Product product;
  late final int numOfItem;
  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: products[0], numOfItem: 2),
  Cart(product: products[1], numOfItem: 1),
  Cart(product: products[3], numOfItem: 5),
  Cart(product: products[2], numOfItem: 4),
  Cart(product: products[4], numOfItem: 3),
];

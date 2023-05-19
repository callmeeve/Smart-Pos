class Product {
  final String image, title, category;
  final int price, size, id, quantitySold;
  final DateTime datetimeSold;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.size,
    required this.datetimeSold,
    required this.quantitySold,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Kopi Susu Original",
    price: 13000,
    size: 12,
    image: "assets/images/eskopisusu.jpg",
    category: "Coffee Based",
    datetimeSold: DateTime(2022, 8, 1, 10, 30),
    quantitySold: 20,
  ),
  Product(
    id: 2,
    title: "Americano",
    price: 12000,
    size: 8,
    image: "assets/images/americano.jpg",
    category: "Coffee Based",
    datetimeSold: DateTime(2022, 8, 1, 10, 30),
    quantitySold: 15,
  ),
  Product(
    id: 3,
    title: "Chocolate",
    price: 15000,
    size: 10,
    image: "assets/images/chocolate.jpg",
    category: "Milk Based",
    datetimeSold: DateTime(2022, 8, 1, 11, 30),
    quantitySold: 15,
  ),
  Product(
    id: 4,
    title: "Matcha",
    price: 14000,
    size: 11,
    image: "assets/images/matcha.jpg",
    category: "Milk Based",
    datetimeSold: DateTime(2022, 8, 2, 11, 30),
    quantitySold: 8,
  ),
  Product(
    id: 5,
    title: "Lemonade",
    price: 10000,
    size: 12,
    image: "assets/images/lemonade.jpg",
    category: "Fresh",
    datetimeSold: DateTime(2022, 8, 3, 11, 30),
    quantitySold: 10,
  ),
  Product(
    id: 6,
    title: "Kopi Susu Alpukat",
    price: 14000,
    size: 12,
    image: "assets/images/kopialpukat.jpg",
    category: "Signature",
    datetimeSold: DateTime(2022, 8, 3, 12, 30),
    quantitySold: 30,
  ),
];

class Product {
  final String image, title, category;
  final int price, size, id, quantitySold;
  final DateTime dateSold;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.size,
    required this.dateSold,
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
    dateSold: DateTime(2022, 8, 1),
    quantitySold: 20,
  ),
  Product(
    id: 2,
    title: "Americano",
    price: 12000,
    size: 8,
    image: "assets/images/americano.jpg",
    category: "Coffee Based",
    dateSold: DateTime(2022, 8, 2),
    quantitySold: 15,
  ),
  Product(
    id: 3,
    title: "Chocolate",
    price: 15000,
    size: 10,
    image: "assets/images/chocolate.jpg",
    category: "Milk Based",
    dateSold: DateTime(2022, 8, 3),
    quantitySold: 12,
  ),
  Product(
    id: 4,
    title: "Matcha",
    price: 14000,
    size: 11,
    image: "assets/images/matcha.jpg",
    category: "Milk Based",
    dateSold: DateTime(2022, 8, 4),
    quantitySold: 8,
  ),
  Product(
    id: 5,
    title: "Lemonade",
    price: 10000,
    size: 12,
    image: "assets/images/lemonade.jpg",
    category: "Fresh",
    dateSold: DateTime(2022, 8, 5),
    quantitySold: 10,
  ),
  Product(
    id: 6,
    title: "Kopi Susu Alpukat",
    price: 14000,
    size: 12,
    image: "assets/images/kopialpukat.jpg",
    category: "Signature",
    dateSold: DateTime(2022, 8, 6),
    quantitySold: 30,
  ),
];

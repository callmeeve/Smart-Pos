import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';

class LihatProdukPage extends StatelessWidget {
  final List<Product> products;

  const LihatProdukPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Group products by category
    Map<String, List<Product>> productsByCategory = {};
    for (Product product in products) {
      if (productsByCategory.containsKey(product.category)) {
        productsByCategory[product.category]!.add(product);
      } else {
        productsByCategory[product.category] = [product];
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Lihat Produk dan Kategori'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Products',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              for (Product product in products)
                ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.category),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          //TODO: Implement edit functionality here
                        },
                        icon: const Icon(Icons.edit),
                        color: secondaryYellow,
                      ),
                      IconButton(
                        onPressed: () {
                          //TODO: Implement delete functionality here
                        },
                        icon: const Icon(Icons.delete),
                        color: const Color(0xffe63946),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16.0),
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              for (String category in productsByCategory.keys)
                ListTile(
                  title: Text(category),
                  subtitle:
                      Text('${productsByCategory[category]!.length} products'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

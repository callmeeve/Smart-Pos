import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/pages/kelolaproduct.dart';
import 'package:smartpos/pages/lihatprodukpage.dart';
import 'package:smartpos/theme.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 25.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Produk atau Kategori',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(
                Icons.add_circle_outline_rounded,
                color: primaryBlue,
                size: 28,
              ),
              title: Text(
                'Tambah Produk atau Kategori Baru',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KelolaProductPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 5.0),
            ListTile(
              leading: Icon(
                Icons.inventory_2,
                color: primaryBlue,
                size: 28,
              ),
              title: Text(
                'Lihat Produk atau Kategori',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LihatProdukPage(
                      products: products,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Akun',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(
                Icons.person,
                color: primaryBlue,
                size: 28,
              ),
              title: Text(
                'Ganti Password',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: primaryBlue,
                size: 28,
              ),
              title: Text(
                'Keluar',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

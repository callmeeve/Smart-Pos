import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/components/settings_menu.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/pages/kelolaproduct.dart';
import 'package:smartpos/pages/lihatprodukpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Pengaturan'),
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            SettingsMenu(
              title: "Lihat Produk atau Kategori",
              textcolor: textBlack,
              icon: UniconsLine.archive_alt,
              onPress: () {
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
            SettingsMenu(
              title: "Tambah Produk atau Kategori Baru",
              textcolor: textBlack,
              icon: UniconsLine.plus_circle,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KelolaProductPage(),
                  ),
                );
              },
            ),
            SettingsMenu(
              title: "User Management",
              textcolor: textBlack,
              icon: UniconsLine.user_check,
              onPress: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            SettingsMenu(
              title: "Information",
              textcolor: textBlack,
              icon: UniconsLine.file_info_alt,
              onPress: () {},
            ),
            SettingsMenu(
              title: "Logout",
              textcolor: Colors.red,
              icon: UniconsLine.signout,
              endIcon: false,
              onPress: () {},
            ),
            // Text(
            //   'Produk atau Kategori',
            //   style: GoogleFonts.poppins(
            //     fontWeight: FontWeight.w700,
            //     fontSize: 16.0,
            //   ),
            // ),
            // const SizedBox(height: 10.0),
            // ListTile(
            //   leading: Icon(
            //     Icons.add_circle_outline_rounded,
            //     color: primaryBlue,
            //     size: 28,
            //   ),
            //   title: Text(
            //     'Tambah Produk atau Kategori Baru',
            //     style: GoogleFonts.poppins(
            //       fontSize: 14.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const KelolaProductPage(),
            //       ),
            //     );
            //   },
            // ),
            // const SizedBox(height: 5.0),
            // ListTile(
            //   leading: Icon(
            //     Icons.inventory_2,
            //     color: primaryBlue,
            //     size: 28,
            //   ),
            //   title: Text(
            //     'Lihat Produk atau Kategori',
            //     style: GoogleFonts.poppins(
            //       fontSize: 14.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LihatProdukPage(
            //           products: products,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // const SizedBox(height: 16.0),
            // Text(
            //   'Akun',
            //   style: GoogleFonts.poppins(
            //     fontWeight: FontWeight.w700,
            //     fontSize: 16.0,
            //   ),
            // ),
            // const SizedBox(height: 8.0),
            // ListTile(
            //   leading: Icon(
            //     Icons.person,
            //     color: primaryBlue,
            //     size: 28,
            //   ),
            //   title: Text(
            //     'Ganti Password',
            //     style: GoogleFonts.poppins(
            //       fontSize: 14.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.exit_to_app,
            //     color: primaryBlue,
            //     size: 28,
            //   ),
            //   title: Text(
            //     'Keluar',
            //     style: GoogleFonts.poppins(
            //       fontSize: 14.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

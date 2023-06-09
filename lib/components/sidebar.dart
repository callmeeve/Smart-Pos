import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpos/pages/attendancepage.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/pages/dashboardpage/dashboardpage.dart';
import 'package:smartpos/pages/loginpage.dart';
import 'package:smartpos/pages/pengaturanpage.dart';
import 'package:smartpos/pages/penjualanpage.dart';
import 'package:smartpos/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  void logout(BuildContext context) {
    // Clear any user-related data from the application state
    // (e.g. user authentication tokens, user preferences, etc.)

    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            headerWidget(),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/manager.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Manajer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/cashier.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Kasir'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashierPage(),
                  ),
                );
              },
            ),
            // ListTile(
            //   contentPadding: const EdgeInsets.only(left: defaultPadding),
            //   leading: const ImageIcon(
            //     AssetImage(
            //       "assets/icons/store.png",
            //     ),
            //   ),
            //   iconColor: primaryBlue,
            //   textColor: primaryBlue,
            //   title: const Text('Penjualan'),
            //   onTap: () {},
            // ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/task.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Laporan Penjualan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LaporanPenjualanPage(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/attendance.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Absensi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendancePage()),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/settings.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PengaturanPage(
                        // products: products,
                        ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: defaultPadding),
                leading: const ImageIcon(
                  AssetImage(
                    "assets/icons/dish.png",
                  ),
                ),
                iconColor: primaryBlue,
                textColor: primaryBlue,
                title: const Text('Tutup Kasir'),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: defaultPadding),
              leading: const ImageIcon(
                AssetImage(
                  "assets/icons/log_out.png",
                ),
              ),
              iconColor: primaryBlue,
              textColor: primaryBlue,
              title: const Text('Logout Kasir'),
              onTap: () => logout(context),
              // onTap: () async {
              //   await FirebaseAuth.instance.signOut();
              //   // ignore: use_build_context_synchronously
              //   Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => const LoginPage()),
              //     (route) => false,
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      color: primaryBlue,
      width: double.infinity,
      height: 160,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Azizah Olshop',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: textWhiteGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Dinny Azizah',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: textWhiteGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

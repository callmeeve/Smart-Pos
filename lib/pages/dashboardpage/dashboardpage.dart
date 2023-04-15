import 'package:flutter/material.dart';
import 'package:smartpos/pages/dashboardpage/dashboardbody.dart';
import 'package:smartpos/pages/notifikasipage.dart';
import 'package:smartpos/pages/promopage.dart';
import 'package:smartpos/pages/pesanpage.dart';
import 'package:smartpos/pages/karyawanpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int tabIndex = 0;
  late List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      const DashboardBody(),
      const KaryawanPage(),
      const PromoPage(),
      const PesanPage(),
      const NotifikasiPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreens[tabIndex],
      bottomNavigationBar: Material(
        elevation: 10.0,
        child: SalomonBottomBar(
          items: <SalomonBottomBarItem>[
            SalomonBottomBarItem(
              icon: const Icon(UniconsLine.analytics),
              title: const Text('Dashboard'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(UniconsLine.users_alt),
              title: const Text('Karyawan'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(UniconsLine.pricetag_alt),
              title: const Text('Promo'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(UniconsLine.envelope_alt),
              title: const Text('Pesan'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications),
              title: const Text('Notifikasi'),
            ),
          ],
          currentIndex: tabIndex,
          selectedItemColor: primaryBlue,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}

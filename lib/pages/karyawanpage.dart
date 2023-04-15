import 'package:flutter/material.dart';
import 'package:smartpos/components/karyawan_list.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Karyawan'),
        elevation: 8,
      ),
      drawer: const SideBar(),
      body: const KaryawanBody(),
    );
  }
}

class KaryawanBody extends StatelessWidget {
  const KaryawanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                KaryawanList(
                  gambar:
                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  nama: 'Thariq',
                  pekerjaan: 'Barista',
                ),
                SizedBox(
                  height: 15.0,
                ),
                KaryawanList(
                  gambar:
                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  nama: 'Krisna',
                  pekerjaan: 'Headbar',
                ),
                SizedBox(
                  height: 15.0,
                ),
                KaryawanList(
                  gambar:
                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  nama: 'Ubay',
                  pekerjaan: 'Barista',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

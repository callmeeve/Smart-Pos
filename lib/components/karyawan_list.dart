import 'package:flutter/material.dart';

class KaryawanList extends StatelessWidget {
  final String nama;
  final String pekerjaan;
  final String gambar;
  const KaryawanList({
    super.key,
    required this.nama,
    required this.pekerjaan,
    required this.gambar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(
              gambar,
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nama,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                pekerjaan,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
            ],
          )
        ],
      ),
    );
  }
}

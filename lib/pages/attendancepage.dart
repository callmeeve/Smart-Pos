import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/karyawan_list.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _dateTime = DateTime.now();

  late final Map<String, bool> _attendance = {
    for (var k in demoKaryawans) k.nama: false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Absensi Pegawai'),
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDateField(),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: demoKaryawans.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(demoKaryawans[index].nama),
                    subtitle: Text(demoKaryawans[index].pekerjaan),
                    value: _attendance[demoKaryawans[index].nama],
                    onChanged: (value) {
                      setState(() {
                        _attendance[demoKaryawans[index].nama] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            CustomizedButton(
              borderColor: primaryBlue,
              buttonColor: Colors.white,
              textColor: primaryBlue,
              buttonText: 'Save',
              onPressed: () {
                // TODO: Save the attendance record.
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: _dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _dateTime = selectedDate;
            });
          }
        });
      },
      child: InputDecorator(
        decoration: const InputDecoration(
            labelText: 'Tanggal', border: OutlineInputBorder()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.date_range),
            const SizedBox(width: 8.0),
            Text(DateFormat.yMMMd().format(_dateTime)),
          ],
        ),
      ),
    );
  }
}

// Demo data for our employees
final List<KaryawanList> demoKaryawans = [
  const KaryawanList(
    gambar:
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    nama: 'Thariq',
    pekerjaan: 'Barista',
  ),
  const KaryawanList(
    gambar:
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    nama: 'Krisna',
    pekerjaan: 'Headbar',
  ),
  const KaryawanList(
    gambar:
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    nama: 'Ubay',
    pekerjaan: 'Barista',
  ),
];

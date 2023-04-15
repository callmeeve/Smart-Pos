import 'package:flutter/material.dart';
import 'package:smartpos/components/datetime_picker.dart';
import 'package:smartpos/components/line_chart.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Dashboard'),
        elevation: 8,
      ),
      drawer: const SideBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            DateTimePickerReel(),
            LineChart(),
          ],
        ),
      ),
    );
  }
}

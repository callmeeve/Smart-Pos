import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class LaporanPenjualanPage extends StatefulWidget {
  const LaporanPenjualanPage({super.key});

  @override
  _LaporanPenjualanPageState createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage> {
  // define controllers for Start and End Date inputs
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;

  int totalSales = 0;

  // A function handler for the date picker
  Future<void> _showDatePickerDialogue(
      {required BuildContext context,
      required TextEditingController controller}) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2022));
    if (selectedDate != null) {
      setState(() {
        // Update the date controller's value when a date is selected from the dialog
        controller.text = DateFormat('dd MMMM yyyy').format(selectedDate);

        // Check if both start and end dates are set to calculate sales
        if (_startDateController.text.isNotEmpty &&
            _endDateController.text.isNotEmpty) {
          _selectedStartDate =
              DateTime.parse(_startDateController.text).toLocal();
          _selectedEndDate = DateTime.parse(_endDateController.text).toLocal();
          totalSales = _getTotalSales();
        }
      });
    }
  }

  //define a function to calculate and return the total sales within the selected date range
  int _getTotalSales() {
    int totalSales = 0;
    for (Product product in products) {
      if (_selectedStartDate != null && _selectedEndDate != null) {
        if (product.dateSold.isAfter(_selectedStartDate) &&
            product.dateSold.isBefore(_selectedEndDate)) {
          totalSales += product.price * product.quantitySold;
        }
      }
    }
    return totalSales;
  }

  @override
  void initState() {
    super.initState();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();
    _startDateController.text =
        DateFormat('dd MMMM yyyy').format(_selectedStartDate);
    _endDateController.text =
        DateFormat('dd MMMM yyyy').format(_selectedEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Penjualan"),
        backgroundColor: primaryBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),

            // Start Date Picker field
            TextField(
              controller: _startDateController,
              readOnly: true,
              onTap: () {
                _showDatePickerDialogue(
                    context: context, controller: _startDateController);
              },
              decoration: InputDecoration(
                labelText: "Start Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(UniconsLine.calendar_alt),
              ),
            ),

            SizedBox(height: 20),

            // End Date Picker Field
            TextField(
              controller: _endDateController,
              readOnly: true,
              onTap: () {
                _showDatePickerDialogue(
                    context: context, controller: _endDateController);
              },
              decoration: InputDecoration(
                labelText: "End Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(UniconsLine.calendar_alt),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Total Sales: Rp${totalSales}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = products[index];
                    return ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.quantitySold} x Rp${product.price} = Rp${product.quantitySold * product.price}",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      trailing: Text(
                        DateFormat('dd/MM/yyyy').format(product.dateSold),
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

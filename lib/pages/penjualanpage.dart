import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class LaporanPenjualanPage extends StatefulWidget {
  const LaporanPenjualanPage({Key? key}) : super(key: key);

  @override
  _LaporanPenjualanPageState createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;

  int totalSales = 0;

  @override
  void initState() {
    super.initState();
    _selectedStartDate = DateTime.now().toLocal();
    _selectedEndDate = DateTime.now().toLocal();
    _startDateController.text =
        DateFormat('dd MMMM yyyy').format(_selectedStartDate);
    _endDateController.text =
        DateFormat('dd MMMM yyyy').format(_selectedEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Penjualan"),
        backgroundColor: primaryBlue,
      ),
      drawer: const SideBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: _buildDateField(
                _startDateController,
                "Start Date",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: _buildDateField(
                _endDateController,
                "End Date",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(product.image),
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.title,
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: textBlack,
                              ),
                            ),
                            Text(
                              "${product.quantitySold} x Rp${product.price} = Rp${product.quantitySold * product.price}",
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(
                                product.dateSold,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(TextEditingController controller, String labelText) {
    return InkWell(
      onTap: () => _showDatePickerDialogue(
        context: context,
        controller: controller,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.date_range),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextFormField(
                controller: controller,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A function handler for the date picker
  Future<void> _showDatePickerDialogue({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
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

// define a function to calculate and return the total sales within the selected date range
  int _getTotalSales() {
    int totalSales = 0;
    for (Product product in products) {
      if (product.dateSold.isAfter(_selectedStartDate) &&
          product.dateSold.isBefore(_selectedEndDate)) {
        totalSales += product.price * product.quantitySold;
      }
    }
    return totalSales;
  }
}

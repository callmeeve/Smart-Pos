import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/models/Product.dart';
import 'package:smartpos/theme.dart';

class LaporanPenjualanPage extends StatefulWidget {
  const LaporanPenjualanPage({Key? key}) : super(key: key);

  @override
  _LaporanPenjualanPageState createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage> {
  DateTime? _selectedDate;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = products.isNotEmpty ? products.first.dateSold : null;
    filterProducts();
  }

  void filterProducts() {
    if (_selectedDate != null) {
      filteredProducts = products
          .where((product) =>
              product.dateSold
                  .isAfter(_selectedDate!.subtract(const Duration(days: 1))) &&
              product.dateSold
                  .isBefore(_selectedDate!.add(const Duration(days: 1))))
          .toList();
    } else {
      filteredProducts = [];
    }
  }

  void onDateChanged(DateTime? newValue) {
    setState(() {
      _selectedDate = newValue;
      filterProducts();
    });
  }

  int calculateTotalSales() {
    int totalSales = 0;
    for (var product in filteredProducts) {
      totalSales += product.price * product.quantitySold;
    }
    return totalSales;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Penjualan'),
        backgroundColor: primaryBlue,
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal: ',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton<DateTime>(
                        value: _selectedDate,
                        onChanged: onDateChanged,
                        items: generateDateItems(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                        underline:
                            const SizedBox(), // Remove the default underline
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                'Laporan Penjualan',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = filteredProducts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 0,
                    ),
                    child: Card(
                      color: primaryBlue,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat.yMd().format(product.dateSold),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: textWhiteGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    product.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textWhiteGrey,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${product.price} x ${product.quantitySold}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: textWhiteGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Rp. ${product.price * product.quantitySold}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: textWhiteGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Card(
              color: primaryBlue,
              elevation: 4, // Controls the shadow depth
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Gives the card rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Sales',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhiteGrey,
                      ),
                    ),
                    Text(
                      'Rp. ${calculateTotalSales().toString()}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhiteGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<DateTime>> generateDateItems() {
  Set<DateTime> uniqueDates = {};

  for (var product in products) {
    if (!uniqueDates.contains(product.dateSold)) {
      uniqueDates.add(product.dateSold);
    }
  }

  return uniqueDates
      .map(
        (date) => DropdownMenuItem<DateTime>(
          value: date,
          child: Text(
            DateFormat.yMd().format(date),
          ),
        ),
      )
      .toList();
}

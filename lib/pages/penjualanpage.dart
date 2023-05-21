import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';

class LaporanPenjualanPage extends StatefulWidget {
  const LaporanPenjualanPage({Key? key}) : super(key: key);

  @override
  _LaporanPenjualanPageState createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage> {
  DateTime? _selectedDate;
  List<Product> filteredProducts = [];
  List<DateTime> _uniqueDates = [];
  List<String> invoiceNumbers = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = products.isNotEmpty ? products.first.datetimeSold : null;
    filterProducts();
  }

  void filterProducts() {
    if (_selectedDate != null) {
      filteredProducts = products
          .where((product) =>
              product.datetimeSold.year == _selectedDate!.year &&
              product.datetimeSold.month == _selectedDate!.month &&
              product.datetimeSold.day == _selectedDate!.day)
          .toList();
      Set<DateTime> uniqueDates = {};
      for (var product in filteredProducts) {
        uniqueDates.add(product.datetimeSold);
      }
      _uniqueDates = uniqueDates.toList();
      invoiceNumbers = generateInvoiceNumbers(filteredProducts);
    } else {
      filteredProducts = [];
      _uniqueDates = [];
      invoiceNumbers = [];
    }
  }

  void onDateChanged(DateTime? newValue) {
    setState(() {
      _selectedDate = newValue;
      filterProducts();
      invoiceNumbers = generateInvoiceNumbers(filteredProducts);
    });
  }

  int calculateTotalSales() {
    int totalSales = 0;
    for (var product in filteredProducts) {
      totalSales += product.price * product.quantitySold;
    }
    return totalSales;
  }

  List<String> generateInvoiceNumbers(List<Product> products) {
    invoiceNumbers = [];
    for (int i = 0; i < products.length; i++) {
      Product product = products[i];
      if (product.datetimeSold.year == _selectedDate!.year &&
          product.datetimeSold.month == _selectedDate!.month &&
          product.datetimeSold.day == _selectedDate!.day) {
        String formattedDateTime =
            "${product.datetimeSold.day.toString().padLeft(2, '0')}${product.datetimeSold.month.toString().padLeft(2, '0')}${product.datetimeSold.year.toString().substring(2)}";
        String invoiceNumber =
            'BL-$formattedDateTime-${(invoiceNumbers.length + 1).toString().padLeft(3, '0')}';
        invoiceNumbers.add(invoiceNumber);
      }
    }

    return invoiceNumbers;
  }

  int calculateSubtotal(DateTime datetime) {
    int subtotal = 0;
    for (Product product in filteredProducts) {
      if (product.datetimeSold == datetime) {
        subtotal += product.price * product.quantitySold;
      }
    }
    return subtotal;
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                itemCount: _uniqueDates.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime date = _uniqueDates[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: primaryBlue,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 10.0,
                                    ),
                                    child: Text(
                                      'Nota: ${filteredProducts.isNotEmpty ? invoiceNumbers[index] : 'Tidak ada nomor nota'}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: textWhiteGrey,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical: 8.0,
                                        ),
                                        child: Text(
                                          DateFormat.yMd().format(date),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: textWhiteGrey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 10.0,
                                        ),
                                        child: Text(
                                          DateFormat.Hm().format(date),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: textWhiteGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: filteredProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Product product = filteredProducts[index];
                                  if (product.datetimeSold == date) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal:',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textWhiteGrey,
                                      ),
                                    ),
                                    Text(
                                      'Rp. ${calculateSubtotal(date).toString()}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textWhiteGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: primaryBlue,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
    bool isDuplicate = false;
    for (var date in uniqueDates) {
      if (isSameDate(date, product.datetimeSold)) {
        isDuplicate = true;
        break;
      }
    }
    if (!isDuplicate) {
      uniqueDates.add(product.datetimeSold);
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

bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

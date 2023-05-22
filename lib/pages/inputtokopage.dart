import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/customized_textfield.dart';
import 'package:smartpos/components/upload_photo.dart';
import 'package:smartpos/pages/cashierpage/cashierpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class InputTokoPage extends StatefulWidget {
  const InputTokoPage({super.key});

  @override
  State<InputTokoPage> createState() => _InputTokoPageState();
}

class _InputTokoPageState extends State<InputTokoPage> {
  final TextEditingController _businessnameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _productpriceController = TextEditingController();
  final TextEditingController _accountnumberController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _capitalpriceController = TextEditingController();

  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                "Product Details",
                style: GoogleFonts.poppins(
                  color: primaryBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ImageUploadForm(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Business Name',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _businessnameController,
                  hintText: "Enter your business name",
                  isPassword: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Business Location',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _locationController,
                  hintText: "Enter your business location",
                  isPassword: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Account Number',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _accountnumberController,
                  hintText: "Enter your account number",
                  isPassword: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Product Name',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _productnameController,
                  hintText: "Enter your product name",
                  isPassword: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Product Price',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _productpriceController,
                  hintText: "Enter your product price",
                  isPassword: false,
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showContent = !_showContent;
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Text(
                          _showContent
                              ? "Detail Tambahan (Optional)"
                              : "Detail Tambahan (Optional)",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        _showContent
                            ? UniconsLine.angle_up
                            : UniconsLine.angle_down,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _showContent
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'Product Description',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomizedTextfield(
                                myController: _descriptionController,
                                hintText: "Enter your product description",
                                isPassword: false,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'Product Capital Price',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomizedTextfield(
                                myController: _capitalpriceController,
                                hintText: "Enter your product capital price",
                                isPassword: false,
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            CustomizedButton(
              buttonText: "Simpan",
              buttonColor: primaryBlue,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CashierPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

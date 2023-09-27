import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/components/customized_button.dart';
import 'package:smartpos/components/customized_textfield.dart';
import 'package:smartpos/components/upload_photo.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class KelolaProductPage extends StatefulWidget {
  const KelolaProductPage({super.key});

  @override
  State<KelolaProductPage> createState() => _KelolaProductPageState();
}

class _KelolaProductPageState extends State<KelolaProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _capitalpriceController = TextEditingController();

  bool _showContent = false;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _capitalpriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBlue,
          title: const Text('Buat Produk Baru'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Tambah Produk'),
              Tab(text: 'Tambah Kategori'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildInformasiProduk(context),
            buildInformasiKategori(context),
          ],
        ),
      ),
    );
  }

  Widget buildInformasiProduk(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                    'Product Name',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _nameController,
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
                  myController: _priceController,
                  hintText: "Enter your product price",
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
                    'Product Category',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _categoryController,
                  hintText: "Enter your product category",
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInformasiKategori(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 20.0,
              ),
              child: Text(
                "Tambah Kategori Produk",
                style: GoogleFonts.poppins(
                  color: primaryBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Nama Kategori',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _categoryController,
                  hintText: "Enter your category name",
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
                    'Deskripsi (Optional)',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomizedTextfield(
                  myController: _descriptionController,
                  hintText: "Enter your description",
                  isPassword: false,
                ),
              ],
            ),
            CustomizedButton(
              buttonText: "Simpan",
              buttonColor: primaryBlue,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

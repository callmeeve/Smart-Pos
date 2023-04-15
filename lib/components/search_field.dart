import 'package:flutter/material.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/pages/filterpage.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  final void Function(String value) onChanged;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late List<Product> _filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: TextField(
                onChanged: widget.onChanged,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBDBDBD),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF212121),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          margin: const EdgeInsets.only(right: 20),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: primaryBlue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: GestureDetector(
            onTap: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FilterPage()),
              );

              if (result != null) {
                var showSaleItems = result['showSaleItems'] ?? false;

                //TODO: apply filter logic based on selected options
              }
            },
            child: const Icon(
              UniconsLine.list_ui_alt,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

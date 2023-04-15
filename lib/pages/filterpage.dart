import 'package:flutter/material.dart';
import 'package:smartpos/models/product.dart';
import 'package:smartpos/theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final bool _showSaleItems = false;
  String? _selectedCategory; // Holds the selected category filter value
  RangeValues _priceRange = const RangeValues(
      0, 100000); // Holds the selected price range filter value
  RangeValues _dateRange = RangeValues(
    DateTime(2022, 7, 26).millisecondsSinceEpoch.toDouble(),
    DateTime.now().millisecondsSinceEpoch.toDouble(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Filter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final filteredProducts = products.where((product) {
                if (_showSaleItems && product.price <= 10000) {
                  // Only show products on sale within a certain price range
                  return true;
                }
                if (_selectedCategory != null &&
                    product.category != _selectedCategory) {
                  // Only show products in the selected category
                  return false;
                }
                if (product.price < _priceRange.start.toInt() ||
                    product.price > _priceRange.end.toInt()) {
                  // Only show products within the selected price range
                  return false;
                }
                if (product.dateSold.millisecondsSinceEpoch <
                        _dateRange.start.toInt() ||
                    product.dateSold.millisecondsSinceEpoch >
                        _dateRange.end.toInt()) {
                  // Only show products sold within the selected date range
                  return false;
                }
                return true;
              }).toList();
              Navigator.pop(context, filteredProducts);
            },
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Category'),
              DropdownButton<String>(
                value: _selectedCategory,
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                items: ['Coffee Based', 'Milk Based', 'Fresh', 'Signature']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Price range'),
              RangeSlider(
                values: _priceRange,
                activeColor: primaryBlue,
                min: 0,
                max: 100000,
                divisions: 10,
                labels: RangeLabels(
                    _priceRange.start.toString(), _priceRange.end.toString()),
                onChanged: (values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text('Date range'),
              RangeSlider(
                values: _dateRange,
                activeColor: primaryBlue,
                min: DateTime(2022, 7, 26).millisecondsSinceEpoch.toDouble(),
                max: DateTime.now().millisecondsSinceEpoch.toDouble(),
                divisions: products.length,
                labels: RangeLabels(
                    DateTime.fromMillisecondsSinceEpoch(
                            _dateRange.start.toInt())
                        .toString()
                        .split(' ')[0],
                    DateTime.fromMillisecondsSinceEpoch(_dateRange.end.toInt())
                        .toString()
                        .split(' ')[0]),
                onChanged: (values) {
                  setState(() {
                    _dateRange = values;
                  });
                },
              ),
            ],
          )),
    );
  }
}

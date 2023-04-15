import 'package:flutter/material.dart';
import 'package:smartpos/theme.dart';

class Categories extends StatefulWidget {
  final void Function(int index)? onCategorySelected;
  const Categories({Key? key, this.onCategorySelected}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  static const List<String> categories = [
    "All",
    "Coffee Based",
    "Milk Based",
    "Fresh",
    "Signature",
  ];

  // By default our first item will be selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        if (widget.onCategorySelected != null) {
          widget.onCategorySelected!(index);
        }
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 3.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildButton(index),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index) {
    return Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
        color: selectedIndex == index ? primaryBlue : Colors.transparent,
        border: Border.all(
          color: selectedIndex == index ? Colors.transparent : primaryBlue,
          width: selectedIndex == index ? 2.0 : 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: selectedIndex == index ? Colors.white : primaryBlue,
          ),
        ),
      ),
    );
  }
}

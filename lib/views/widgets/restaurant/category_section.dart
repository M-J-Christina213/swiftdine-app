import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Pizza", "Drinks", "Desserts"];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: categories
            .map((cat) => Chip(label: Text(cat)))
            .toList(),
      ),
    );
  }
}
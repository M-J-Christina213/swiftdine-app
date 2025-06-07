import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Pizza", "Burgers", "Sushi", "Desserts", "Salads"];
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (context, index) => Chip(
          label: Text(categories[index]),
          backgroundColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
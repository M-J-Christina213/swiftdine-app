import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/widgets/restaurant/menu_list.dart';

class CategoryMenuScreen extends StatelessWidget {
  final String category;

  const CategoryMenuScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: MenuList(category: category),
    );
  }
}

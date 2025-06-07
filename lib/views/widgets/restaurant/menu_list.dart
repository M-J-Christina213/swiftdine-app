import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Menu", style: theme.textTheme.titleLarge),
        ),
        ListTile(
          leading: Image.asset("assets/images/pizza1.jpg", width: 50, height: 50),
          title: const Text("Spicy Chicken Pizza"),
          subtitle: const Text("Spicy · Chef's Special\nA hot favorite with peri-peri chicken"),
          trailing: Column(
            children: [
              const Text("Rs. 1200"),
              const SizedBox(height: 4),
              ElevatedButton(onPressed: () {}, child: const Text("Add")),
            ],
          ),
        ),
      ],
    );
  }
}

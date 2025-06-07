import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Sri Lankan Specials', 'icon': '🍛'},
      {'label': 'Seafood Dishes', 'icon': '🦐'},
      {'label': 'Chicken Dishes', 'icon': '🍗'},
      {'label': 'Spicy Dishes', 'icon': '🌶️'},
      {'label': 'Indian', 'icon': '🍲'},
      {'label': 'Chinese', 'icon': '🥡'},
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: categories.map((category) {
        return GestureDetector(
          onTap: () {
            // Handle tap event if needed
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category['icon']!,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  category['label']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

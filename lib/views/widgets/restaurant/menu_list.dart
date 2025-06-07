import 'package:flutter/material.dart';
import 'package:swiftdine_app/models/menu_item.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final List<MenuItem> menuItems = [
    MenuItem(
      id: "1",
      name: "Cheese Kottu Roti",
      description: "Spicy chopped godamba roti with vegetables, chicken and cheese.",
      price: 850.00,
      imageUrl: "https://tb-static.uber.com/prod/image-proc/...jpg",
      category: "Sri Lankan",
    ),
    MenuItem(
      id: "2",
      name: "Egg Hoppers",
      description: "Crispy bowl-shaped pancakes with a soft egg center.",
      price: 450.00,
      imageUrl: "https://i0.wp.com/www.lavenderandlovage.com/...jpg",
      category: "Sri Lankan",
    ),
    MenuItem(
      id: "3",
      name: "Devilled Prawns",
      description: "Wok-tossed prawns in tangy, spicy sauce with bell peppers.",
      price: 1750.00,
      imageUrl: "https://media.cntravellerme.com/photos/66cc5cb7...jpg",
      category: "Seafood",
    ),
    // Add more items...
  ];

  // Tracks quantity per item ID
  final Map<String, int> itemQuantities = {};

  void increaseQuantity(String id) {
    setState(() {
      itemQuantities[id] = (itemQuantities[id] ?? 0) + 1;
    });
  }

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
        ...menuItems.map((item) {
          final quantity = itemQuantities[item.id] ?? 0;
          final totalPrice = (item.price * quantity).toStringAsFixed(2);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Image.network(
                item.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              ),
              title: Text(item.name),
              subtitle: Text(
                "${item.category}\n${item.description}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(quantity > 0 ? "Rs. $totalPrice" : "Rs. ${item.price}"),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () => increaseQuantity(item.id),
                    child: Text(quantity > 0 ? "Add More ($quantity)" : "Add"),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
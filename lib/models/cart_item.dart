

// ignore_for_file: file_names

class CartItem {
  final String name;
  final String description;
  final String featuredRestaurant;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.description,
    required this.featuredRestaurant,
    required this.price,
    this.quantity = 1,
  });
}

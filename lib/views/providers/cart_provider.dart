import 'package:flutter/material.dart';
import 'package:swiftdine_app/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem newItem) {
    final index = _items.indexWhere((item) =>
        item.name == newItem.name &&
        item.featuredRestaurant == newItem.featuredRestaurant);

    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(newItem);
    }
    notifyListeners();
  }

  void updateQuantity(int index, int newQty) {
    _items[index].quantity = newQty;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice => _items.fold(
      0.0, (sum, item) => sum + (item.price * item.quantity));
}

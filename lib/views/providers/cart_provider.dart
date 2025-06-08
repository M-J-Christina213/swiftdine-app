import 'package:flutter/material.dart';
import 'package:swiftdine_app/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(CartItem newItem) {
    final existingIndex = _items.indexWhere((item) => item.name == newItem.name);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(newItem);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      removeItem(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

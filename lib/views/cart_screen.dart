import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/providers/cart_provider.dart';
import '../models/cart_item.dart';
import 'package:swiftdine_app/views/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: cart.items.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final CartItem item = cart.items[index];
                      return Card(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(item.description),
                              const SizedBox(height: 4),
                              Text("From: ${item.featuredRestaurant}"),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "LKR ${(item.price * item.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon:
                                            const Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            cart.updateQuantity(index, item.quantity - 1);
                                          }
                                        },
                                      ),
                                      Text('${item.quantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle_outline),
                                        onPressed: () {
                                          cart.updateQuantity(index, item.quantity + 1);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline),
                                        onPressed: () => cart.removeItem(index),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("LKR ${cart.totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CheckoutScreen(),
                              ),
                            );
                          },
                          child: const Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

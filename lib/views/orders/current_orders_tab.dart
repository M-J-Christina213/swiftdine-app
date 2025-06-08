import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/widgets/orders/current_order_cart.dart';

class CurrentOrdersTab extends StatelessWidget {
  const CurrentOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CurrentOrderCard();
      },
    );
  }
}

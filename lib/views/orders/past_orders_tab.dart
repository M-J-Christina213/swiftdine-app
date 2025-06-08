import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/widgets/orders/past_order_card.dart';

class PastOrdersTab extends StatelessWidget {
  const PastOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const PastOrderCard();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'order_status_chip.dart';

class PastOrderCard extends StatelessWidget {
  const PastOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order #221045", style: AppTheme.headingStyle),
            const SizedBox(height: 8),
            Text("Items: Chicken Biryani, Coke", style: AppTheme.descriptionStyle),
            const SizedBox(height: 8),
            Text("Total: LKR 1850.00", style: AppTheme.priceStyle),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Date: 06 June 2025"),
                OrderStatusChip(status: "Delivered", color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

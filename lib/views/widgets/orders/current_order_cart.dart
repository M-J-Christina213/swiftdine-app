import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'order_status_chip.dart';

class CurrentOrderCard extends StatelessWidget {
  const CurrentOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppTheme.primaryColor,
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/images/d1.png"),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Driver: John Silva", style: AppTheme.headingStyle),
                    Text("ETA: 10 mins", style: AppTheme.descriptionStyle),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/map2.png",
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text("Order #221048", style: AppTheme.headingStyle),
            const SizedBox(height: 8),
            Text("Items: Chicken Biryani x1, Coke x2",
                style: AppTheme.descriptionStyle),
            const SizedBox(height: 4),
            Text("Total: LKR 1850.00", style: AppTheme.priceStyle),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Status"),
                OrderStatusChip(status: "On the Way", color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

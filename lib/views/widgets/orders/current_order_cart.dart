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
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/driver1.jpg"),
                  radius: 24,
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
            const SizedBox(height: 12),
            Image.asset(
              "assets/images/map_preview.png",
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Order #221048"),
                OrderStatusChip(status: "On the Way", color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NearbyMap extends StatelessWidget {
  const NearbyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text("Map Placeholder")),
    );
  }
}
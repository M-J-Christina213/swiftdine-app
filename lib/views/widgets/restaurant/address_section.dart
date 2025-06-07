import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Call Restaurant"),
        content: const Text("Would you like to call: (011) 234-5678?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(onPressed: () {}, child: const Text("Call")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("123 Main St, Colombo", style: theme.textTheme.bodyMedium)),
          ElevatedButton.icon(
            onPressed: () => _showCallDialog(context),
            icon: const Icon(Icons.call),
            label: const Text("Call"),
          )
        ],
      ),
    );
  }
}
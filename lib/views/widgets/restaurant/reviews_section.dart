import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Reviews", style: theme.textTheme.titleLarge),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text("A")),
          title: const Text("Delicious food and fast service."),
          subtitle: const Text("by Alex"),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text("B")),
          title: const Text("Loved the ambiance!"),
          subtitle: const Text("by Bella"),
        ),
      ],
    );
  }
}
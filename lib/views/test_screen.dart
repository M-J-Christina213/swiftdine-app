import 'package:flutter/material.dart';

class ImageTestScreen extends StatelessWidget {
  const ImageTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Image')),
      body: Center(
        child: Image.asset('assets/images/pol.png'),
      ),
    );
  }
}

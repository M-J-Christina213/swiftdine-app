import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Gallery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset("assets/images/gallery1.jpg", width: 120),
              Image.asset("assets/images/gallery2.jpg", width: 120),
              Image.asset("assets/images/gallery3.jpg", width: 120),
            ],
          ),
        ),
      ],
    );
  }
}
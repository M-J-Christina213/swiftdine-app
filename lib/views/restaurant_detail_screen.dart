import 'package:flutter/material.dart';
import '../views/widgets/restaurant/restaurant_header.dart';
import '../views/widgets/restaurant/address_section.dart';
import '../views/widgets/restaurant/action_buttons.dart';
import '../views/widgets/restaurant/category_section.dart';
import '../views/widgets/restaurant/menu_list.dart';
import '../views/widgets/restaurant/gallery_section.dart';
import '../views/widgets/restaurant/reviews_section.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant Details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RestaurantHeader(),
            AddressSection(),
            ActionButtons(),
            CategorySection(),
            MenuList(),
            GallerySection(),
            ReviewsSection(),
          ],
        ),
      ),
    );
  }
}

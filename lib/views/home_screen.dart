import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'package:swiftdine_app/views/widgets/category_list.dart';
import 'package:swiftdine_app/views/widgets/restaurant_card.dart';
import 'package:swiftdine_app/views/widgets/search_bar.dart';
import 'package:swiftdine_app/views/widgets/section_title.dart';
import 'package:swiftdine_app/views/widgets/nearby_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Image.asset('assets/images/swiftdine.jpg', height: 80),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.location_on_outlined, color: AppTheme.primaryColor),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Colombo City Center\n137 Sir James Peiris Mawatha",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const SearchBarWidget(),
              const SizedBox(height: 24),
              const SectionTitle(title: "Explore Categories"),
              const SizedBox(height: 8),
              const CategoryList(),
              const SizedBox(height: 24),
              const SectionTitle(title: "Featured Restaurants"),
              const SizedBox(height: 8),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => RestaurantCard(index: index),
                ),
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: "Restaurants Near You"),
              const SizedBox(height: 8),
              const NearbyMap(),
              const SizedBox(height: 24),
              const SectionTitle(title: "Nearby Hidden Gems"),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => RestaurantCard(index: index, compact: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

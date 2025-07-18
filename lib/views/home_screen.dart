import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'package:swiftdine_app/views/widgets/home/category_list.dart';
import 'package:swiftdine_app/views/widgets/home/menu_data.dart';
import 'package:swiftdine_app/views/widgets/home/mostpopfood.dart';
import 'package:swiftdine_app/views/widgets/home/restaurant_card.dart';
import 'package:swiftdine_app/views/widgets/home/reviews.dart';
import 'package:swiftdine_app/views/widgets/home/search_bar.dart';
import 'package:swiftdine_app/views/widgets/home/section_title.dart';
import 'package:swiftdine_app/views/widgets/home/destination_card.dart';
import 'package:swiftdine_app/controllers/home_controller.dart';
import 'package:swiftdine_app/views/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _location = 'Fetching your location...';
  final HomeController controller = HomeController(); // Destination controller

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!mounted) return;
        setState(() {
          _location = 'Location services are disabled';
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (!mounted) return;
          setState(() {
            _location = 'Location permission denied';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!mounted) return;
        setState(() {
          _location = 'Permission denied forever';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        if (!mounted) return;
        setState(() {
          _location = '${place.locality}, ${place.country}';
        });
      } else {
        if (!mounted) return;
        setState(() {
          _location = 'Location not found';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _location = 'Failed to get location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.location_on_outlined, color: AppTheme.primaryColor),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                _location,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
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
                  itemCount: RestaurantCard.restaurants.length,
                  itemBuilder: (context, index) =>
                      RestaurantCard(index: index),
                ),
              ),
              const SizedBox(height: 24),
              

             
              const SizedBox(height: 24),
              const SectionTitle(title: '🍽️ Find Food Near or Your Destination'),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a location...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/map.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.destinations.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9, 
                ),
                itemBuilder: (context, i) {
                  final d = controller.destinations[i];
                  return DestinationCard(destination: d);

                },
              ),

              
             
             MostPopularFoodsSection(),

              const SizedBox(height: 24),
              const SectionTitle(title: "Nearby Hidden Gems"),
              const SizedBox(height: 8),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: RestaurantCard.restaurants.length,
                  itemBuilder: (context, index) =>
                      RestaurantCard(index: index, compact: true),
                ),
              ),

              ReviewsSection(menuItems: [
                menuItems[0], menuItems[2]]), 
              const SizedBox(height: 24),

            ],


          ),
        ),
      ),
    );
  }
}

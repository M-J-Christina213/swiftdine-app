import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'package:swiftdine_app/views/widgets/category_list.dart';
import 'package:swiftdine_app/views/widgets/restaurant_card.dart';
import 'package:swiftdine_app/views/widgets/search_bar.dart';
import 'package:swiftdine_app/views/widgets/section_title.dart';
import 'package:swiftdine_app/views/widgets/nearby_map.dart';
import 'package:swiftdine_app/views/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _location = 'Fetching your location...';

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _location = 'Location services are disabled';
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _location = 'Location permission denied';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
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
        setState(() {
          _location =
              '${place.locality}, ${place.country}';
        });
      } else {
        setState(() {
          _location = 'Location not found';
        });
      }
    } catch (e) {
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
              const SectionTitle(title: "Restaurants Near You"),
              const SizedBox(height: 12),
              const NearbyMap(),
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
            ],
          ),
        ),
      ),
    );
  }
}

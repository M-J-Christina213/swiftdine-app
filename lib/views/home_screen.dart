import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'package:swiftdine_app/views/widgets/category_list.dart';
import 'package:swiftdine_app/views/widgets/restaurant_card.dart';
import 'package:swiftdine_app/views/widgets/search_bar.dart';
import 'package:swiftdine_app/views/widgets/section_title.dart';
import 'package:swiftdine_app/views/widgets/nearby_map.dart';

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
          _location = '${place.name}, ${place.street}\n${place.locality}, ${place.country}';
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
                children: [
                  const Icon(Icons.location_on_outlined, color: AppTheme.primaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _location,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
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

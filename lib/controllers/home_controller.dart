import '../models/destination.dart';

class HomeController {
  final List<Destination> destinations = [
    Destination(
      name: 'Colombo',
      imagePath: 'assets/images/home/colombo.jpg',
      restaurantCount: 126,
      rating: null,
      description: 'Discover delicious meals across Colombo.',
    ),
    Destination(
      name: 'Galle',
      imagePath: 'assets/images/home/galle.jpeg',
      restaurantCount: 87,
      rating: 4.5,
      description: 'Explore scenic hotspots in Galle.',
    ),
    Destination(
      name: 'Ella',
      imagePath: 'assets/images/home/ella.jpeg',
      restaurantCount: 42,
      rating: 4.8,
      description: 'Taste flavors surrounded by misty hills.',
    ),
    Destination(
      name: 'Kandy',
      imagePath: 'assets/images/home/kandy.jpeg',
      restaurantCount: 68,
      rating: 4.6,
      description: 'Enjoy traditional dining in Kandy.',
    ),
  ];
}

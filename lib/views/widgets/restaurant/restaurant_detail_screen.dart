import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Banner
            Stack(
              children: [
                Image.asset(
                  'assets/restaurant_banner.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sea Breeze Restaurant",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Mount Lavinia",
                          style: TextStyle(color: Colors.white70))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: StadiumBorder(),
                ),
                onPressed: () {},
                child: Text("View Menu"),
              ),
            ),

            // Restaurant Info Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(
                    icon: Icons.location_on,
                    title: "Mount Lavinia",
                    subtitle: "123 Beach Road, Mount Lavinia",
                  ),
                  Image.asset('assets/map_preview.png'),
                  InfoCard(
                    icon: Icons.access_time,
                    title: "Today: Opens at 8PM",
                    subtitle: "Open now",
                  ),
                  InfoCard(
                    icon: Icons.phone,
                    title: "+94 77 123 4567",
                  ),
                  InfoCard(
                    icon: Icons.email,
                    title: "info@restaurant.com",
                  ),
                ],
              ),
            ),

            // Dine-In Preview Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.table_restaurant, color: Colors.orange),
                      SizedBox(width: 8),
                      Text("Dine-in Preview",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tables Grid
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(9, (index) {
                            final table = index + 1;
                            final isAvailable = table > 5;
                            return CircleAvatar(
                              backgroundColor: isAvailable
                                  ? Colors.green
                                  : Colors.grey,
                              radius: 28,
                              child: Text(
                                'T$table',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Features
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Best For",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Wrap(
                              spacing: 8,
                              children: ["👤 Solo", "❤️ Couples", "👥 Groups"]
                                  .map((e) => Chip(label: Text(e)))
                                  .toList(),
                            ),
                            SizedBox(height: 12),
                            Text("Highlights",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            ...["Private Dining", "Ocean View", "Family Friendly"]
                                .map((e) => Row(
                                      children: [
                                        Icon(Icons.check, size: 16),
                                        SizedBox(width: 4),
                                        Text(e),
                                      ],
                                    ))
                                
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: StadiumBorder()),
                    child: Text("Reserve a Table"),
                  ),
                ],
              ),
            ),

            // Delivery and Takeaway
            DeliveryTakeawayCard(),

            // Gallery Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  return Image.asset('assets/gallery_$index.jpg', fit: BoxFit.cover);
                }),
              ),
            ),

            // Ratings & Reviews
            RestaurantRatingReview(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const InfoCard({super.key, required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
      ),
    );
  }
}

class DeliveryTakeawayCard extends StatelessWidget {
  const DeliveryTakeawayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Available",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Minimum Order: Rs. 5000"),
                    Text("Fee: Rs. 300"),
                    Text("ETA: 30-40 mins"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Takeaway Available",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Preparation: 15-20 mins"),
                    Text("Pickup: 10AM - 9PM"),
                    Text("Curbside Pickup, Pre-order 2 days"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RestaurantRatingReview extends StatelessWidget {
  const RestaurantRatingReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ratings & Reviews",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4.6",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(Icons.star,
                              color: Colors.yellow[700], size: 16),
                        ),
                      ),
                      Text("Based on 254 reviews",
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        buildRatingBar(5, 0.7),
                        buildRatingBar(4, 0.2),
                        buildRatingBar(3, 0.06),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ReviewCard(
              name: "Nuwan Perera",
              date: "April 15, 2025",
              comment:
                  "Delicious food and friendly staff! Highly recommended for a casual dinner.",
              image: 'assets/review1.jpg'),
          ReviewCard(
              name: "Hashini Silva",
              date: "March 22, 2025",
              comment:
                  "Loved the ambiance. Perfect for date nights. Would visit again!"),
          ReviewCard(
              name: "Sahan Dissanayake",
              date: "February 10, 2025",
              comment:
                  "Food was okay, but delivery took longer than expected."),
        ],
      ),
    );
  }

  Widget buildRatingBar(int stars, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text("$stars ★", style: TextStyle(fontSize: 12)),
          SizedBox(width: 6),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
                ),
                FractionallySizedBox(
                  widthFactor: percent,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(4)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String comment;
  final String? image;

  const ReviewCard(
      {super.key, required this.name,
      required this.date,
      required this.comment,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user_avatar.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(date, style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
            Text(comment),
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(image!, height: 80, fit: BoxFit.cover),
              )
          ],
        ),
      ),
    );
  }
}

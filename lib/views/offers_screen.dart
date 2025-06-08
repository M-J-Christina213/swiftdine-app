import 'package:flutter/material.dart';

class SpecialOfferScreen extends StatelessWidget {
  final String userName = 'Christina';
  final bool isBirthdayMonth = true;
  final bool isLoggedIn = true;
  final Duration birthdayCountdown = Duration(days: 5, hours: 6, minutes: 30, seconds: 15);

  final List<Map<String, String>> touristOffers = [
    {
      'img': 'https://i.pinimg.com/736x/87/32/67/873267e81c7c5f8a720f8db64ee5a5f3.jpg',
      'title': 'Hotel Guest Dine-In Discount',
      'desc': 'Enjoy 15% off your meal when you show your hotel keycard.',
      'validity': 'Valid till 2025-06-30',
    },
    {
      'img': 'https://i.pinimg.com/736x/06/43/ec/0643ec2da18de339c9d001364993cec3.jpg',
      'title': 'Airport Arrival Snack Deal',
      'desc': 'Free drink with any snack purchase at the airport lounge.',
      'validity': 'Valid till 2025-07-15',
    },
    {
      'img': 'https://i.pinimg.com/736x/6a/3e/e1/6a3ee17d3dbe31a3b666e732a1b8dffe.jpg',
      'title': 'Tourist Welcome Dinner',
      'desc': 'Exclusive 20% off on your first dinner at selected restaurants.',
      'validity': 'Valid till 2025-08-01',
    },
  ];

  SpecialOfferScreen({super.key});

  Widget buildTouristCard(Map<String, String> offer) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                offer['img']!,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    offer['desc']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    offer['validity']!,
                    style: const TextStyle(fontSize: 12, color: Colors.orange),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final timeLeft = birthdayCountdown;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Offers'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isLoggedIn && isBirthdayMonth) ...[
                          Text(
                            '🎂 Happy Birthday, $userName!',
                            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Here’s a Treat Just for You!',
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _buildCountdownBox('Days', timeLeft.inDays),
                              _buildCountdownBox('Hours', timeLeft.inHours.remainder(24)),
                              _buildCountdownBox('Minutes', timeLeft.inMinutes.remainder(60)),
                              _buildCountdownBox('Seconds', timeLeft.inSeconds.remainder(60)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  title: Row(
                                    children: const [
                                      Icon(Icons.cake, color: Colors.orange),
                                      SizedBox(width: 10),
                                      Text("Birthday Offer 🎉")
                                    ],
                                  ),
                                  content: const Text(
                                    "You've successfully claimed your birthday treat! Enjoy exclusive discounts on your next order. 🎂",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.card_giftcard),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            label: const Text('Claim Birthday Offer 🎉'),
                          )
                        ] else ...[
                          const Text(
                            'Special Offers Await You!',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Sign up and complete your profile to unlock exclusive discounts.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      'https://as1.ftcdn.net/jpg/04/52/80/04/1000_F_452800490_YoymrUVa7MYu5dBYKmWQSeK3ym2qiFHx.jpg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tourist Offers', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...touristOffers.map((offer) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: buildTouristCard(offer),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownBox(String label, int value) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$value', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}

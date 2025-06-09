// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferScreen extends StatefulWidget {
  final bool isLoggedIn;
  final bool isBirthdayMonth;
  final String userName;
  final Duration birthdayCountdown;

  const OfferScreen({
    super.key,
    required this.isLoggedIn,
    required this.isBirthdayMonth,
    required this.userName,
    required this.birthdayCountdown,
  });

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late Timer _timer;
  late DateTime _targetDate;
  Duration _timeLeft = Duration.zero;

  // Sample tourist offers data with local assets
  final List<Map<String, String>> touristOffers = [
    {
      'img': 'assets/images/tour1.png',
      'title': 'Hotel Guest Dine-In Discount',
      'desc': 'Enjoy 15% off your meal when you show your hotel keycard.',
      'validity': 'Valid till 2025-06-30',
    },
    {
      'img': 'assets/images/tour2.png',
      'title': 'Airport Arrival Snack Deal',
      'desc': 'Free drink with any snack purchase at the airport lounge.',
      'validity': 'Valid till 2025-07-15',
    },
    {
      'img': 'assets/images/tour3.png',
      'title': 'Tourist Welcome Dinner',
      'desc': 'Exclusive 20% off on your first dinner at selected restaurants.',
      'validity': 'Valid till 2025-08-01',
    },
  ];

  @override
  void initState() {
    super.initState();
    _targetDate = DateTime.now().add(widget.birthdayCountdown);
    _startCountdown();
  }

  void _startCountdown() {
    _updateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimeLeft();
    });
  }

  void _updateTimeLeft() {
    final now = DateTime.now();
    setState(() {
      _timeLeft = _targetDate.difference(now);
      if (_timeLeft.isNegative) {
        _timeLeft = Duration.zero;
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildTimeBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade700.withAlpha((0.5 * 255).round()),
                offset: const Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // Widget for one offer card
  Widget _buildOfferCard(Map<String, String> offer) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                offer['img']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    offer['desc']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    offer['validity']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMM dd, yyyy').format(_targetDate);

    final days = _timeLeft.inDays.toString().padLeft(2, '0');
    final hours = _timeLeft.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = _timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Offers'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with background image + birthday message or sign-up prompt
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset(
                    'assets/images/headb.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withAlpha((0.5 * 255).round()),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.isLoggedIn && widget.isBirthdayMonth) ...[
                                Text(
                                  '🎂 Happy Birthday, ${widget.userName}!',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Birthday on $formattedDate',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 12),

                                // Countdown Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildTimeBox(days, 'Days'),
                                    const SizedBox(width: 12),
                                    _buildTimeBox(hours, 'Hours'),
                                    const SizedBox(width: 12),
                                    _buildTimeBox(minutes, 'Minutes'),
                                    const SizedBox(width: 12),
                                    _buildTimeBox(seconds, 'Seconds'),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: Row(
                                          children: const [
                                            Icon(Icons.cake,
                                                color: Colors.orange),
                                            SizedBox(width: 10),
                                            Text("Birthday Offer 🎉")
                                          ],
                                        ),
                                        content: const Text(
                                          "You've successfully claimed your birthday treat! Enjoy exclusive discounts on your next order. 🎂",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('OK'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.card_giftcard,
                                      color: Colors.white),
                                  label: const Text(
                                    'Claim Birthday Offer 🎉',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                  ),
                                ),
                              ] else ...[
                                const Text(
                                  'Special Offers Await You!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/headf.png',
                              width: 180,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tourist Offers list title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tourist Offers',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // List of offers
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: touristOffers.length,
              itemBuilder: (context, index) {
                return _buildOfferCard(touristOffers[index]);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

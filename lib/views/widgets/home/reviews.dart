import 'package:flutter/material.dart';
import 'package:swiftdine_app/models/menu_item.dart';

class ReviewsSection extends StatelessWidget {
  final List<MenuItem> menuItems;

  const ReviewsSection({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFEEDC),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Text(
            'What Locals & Tourists Say',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange[700],
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Hear from people who’ve experienced our service',
            style: TextStyle(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          LayoutBuilder(builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 600 ? 3 : 1;
            return GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
              children: [
                _testimonialCard(
                  context,
                  name: 'Sarah Chen',
                  subtitle: 'Tourist from Singapore',
                  review:
                      '“As a foodie from Singapore, I\'m super picky with flavor, and SwiftDine did not disappoint! Loved the ease of browsing restaurant menus and reading real reviews from other tourists and locals.”',
                  imagePath: 'assets/images/r1.jpeg',
                ),
                _testimonialCard(
                  context,
                  name: 'Rajitha Perera',
                  subtitle: 'Local',
                  review:
                      '“SwiftDine is a game changer. I usually struggle to recommend good places to my foreign friends, but this made it so much easier. The app helps find hidden gems in one go. Proud to see Sri Lankan options delivering this kind of service!”',
                  imagePath: 'assets/images/r2.jpeg',
                ),
                _testimonialCard(
                  context,
                  name: 'David & Emma Wilson',
                  subtitle: 'Tourist from Australia',
                  review:
                      '“We love exploring food spots during our holidays, and SwiftDine offered great local recommendations with smooth delivery tracking. A must-have for foodies visiting Sri Lanka!”',
                  imagePath: 'assets/images/r3.jpeg',
                ),
              ],
            );
          }),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[600],
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => LeaveReviewDialog(menuItems:
                    menuItems.map((item) => item.name).toList()),
              );
            },
            child: Text(
              'Leave Your Review',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _testimonialCard(
  BuildContext context, {
  required String name,
  required String subtitle,
  required String review,
  required String imagePath,
}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, 
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 26,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[800]),
                ),
                Text(subtitle, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: List.generate(
            5,
            (index) => Icon(Icons.star, color: Colors.amber, size: 18),
          ),
        ),
        SizedBox(height: 8),
        Text(
          review,
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
      ],
    ),
  );
}
}

class LeaveReviewDialog extends StatefulWidget {
  final List<String> menuItems;
  const LeaveReviewDialog({super.key, required this.menuItems});

  @override
  State<LeaveReviewDialog> createState() => _LeaveReviewDialogState();
}

class _LeaveReviewDialogState extends State<LeaveReviewDialog> {
  String? selectedFood;
  double rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Leave Your Review'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedFood,
              hint: Text('Select a food item'),
              items: widget.menuItems
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedFood = val;
                });
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Write your review',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Rating'),
            ),
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1.0;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for image upload
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Image upload not implemented yet")));
              },
              icon: Icon(Icons.image),
              label: Text('Upload Image (optional)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedFood == null ||
                rating == 0 ||
                reviewController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please fill all required fields')),
              );
              return;
            }
            // Submit logic
          
            Navigator.pop(context);
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

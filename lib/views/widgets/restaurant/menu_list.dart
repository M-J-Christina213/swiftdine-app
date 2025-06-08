import 'package:flutter/material.dart';
import 'package:swiftdine_app/models/menu_item.dart';
import 'package:swiftdine_app/themes/app_theme.dart';

class MenuList extends StatefulWidget {
  final String? category;
  final String? restaurant;

  const MenuList({super.key, this.category, this.restaurant});

  @override
  State<MenuList> createState() => _MenuListState();
}


class _MenuListState extends State<MenuList> {
  final List<MenuItem> allItems = [
    // Sri Lankan Special
    MenuItem(id: "1", name: "Cheese Kottu Roti", description: "Chopped flatbread with veggies, egg, and chicken.", price: 850.0, imagePath: "assets/images/kottu.png", category: "Sri Lankan Special", featuredRestaurants: ["Rice Point"], rating: 4.5, likeCount: 42),
    MenuItem(id: "2", name: "Pol Sambol Sandwich", description: "Toasted bread with coconut sambol.", price: 400.0, imagePath: "assets/images/pol.png", category: "Sri Lankan Special", featuredRestaurants: ["Rice Point"], rating: 4.1, likeCount: 19),
    MenuItem(id: "3", name: "Fish Ambulthiyal", description: "Sour fish curry with goraka.", price: 1350.0, imagePath: "assets/images/fish.png", category: "Sri Lankan Special", featuredRestaurants: ["Rice Point"], rating: 4.6, likeCount: 50),
    MenuItem(id: "4", name: "Egg Hoppers", description: "Freshly made egg hoppers with a touch of spice, served hot.", price: 300.0, imagePath: "assets/images/egghoppers.png", category: "Sri Lankan Special", featuredRestaurants: ["Rice Point"], rating: 4.0, likeCount: 21),

    // Seafood Dishes
    MenuItem(id: "5", name: "Devilled Prawns", description: "Tangy stir-fried prawns with bell peppers.", price: 1750.0, imagePath: "assets/images/devilledprawns.png", category: "Seafood Dishes", featuredRestaurants: ["Sea Harvest", "Ocean Bliss"], rating: 4.7, likeCount: 38),
    MenuItem(id: "6", name: "Cuttlefish Curry", description: "Rich seafood curry with tender cuttlefish.", price: 1550.0, imagePath: "assets/images/cuttlefish.png", category: "Seafood Dishes", featuredRestaurants: ["Sea Harvest"], rating: 4.4, likeCount: 30),

    // Chicken Dishes
    MenuItem(id: "7", name: "Chicken Biryani", description: "Fragrant rice dish with marinated chicken.", price: 1000.0, imagePath: "assets/images/biryani.png", category: "Chicken Dishes", featuredRestaurants: ["Spice Fusion"], rating: 4.2, likeCount: 60),
    MenuItem(id: "8", name: "Crispy Chicken Wings", description: "Spicy battered wings with dip.", price: 900.0, imagePath: "assets/images/wings.png", category: "Chicken Dishes", featuredRestaurants: ["Spice Fusion"], rating: 4.2, likeCount: 34),
    MenuItem(id: "9", name: "Chicken Curry", description: "Rich and spicy traditional curry.", price: 1150.0, imagePath: "assets/images/curry.png", category: "Chicken Dishes", featuredRestaurants: ["Spice Fusion"], rating: 4.5, likeCount: 58),

    // Spicy Dishes
    MenuItem(id: "10", name: "Spicy Noodles", description: "Hot and spicy Asian-style noodles.", price: 890.0, imagePath: "assets/images/spicynoodle.png", category: "Spicy Dishes", featuredRestaurants: ["Spice Fusion"], rating: 4.1, likeCount: 22),
    MenuItem(id: "11", name: "Hot Butter Cuttlefish", description: "Crispy spicy seafood delight.", price: 1700.0, imagePath: "assets/images/cuttlefish.png", category: "Spicy Dishes", featuredRestaurants: ["Ocean Bliss"], rating: 4.6, likeCount: 41),
    MenuItem(id: "12", name: "Spicy Egg Noodles", description: "Egg noodles tossed in hot sauce.", price: 850.0, imagePath: "assets/images/eggnoddle.png", category: "Spicy Dishes", featuredRestaurants: ["Spice Fusion"], rating: 4.2, likeCount: 23),

    // Indian
    MenuItem(id: "13", name: "Butter Chicken", description: "Creamy and rich Indian chicken curry.", price: 1200.0, imagePath: "assets/images/butter_chicken.jpg", category: "Indian", featuredRestaurants: ["Tandoori Tales"], rating: 4.8, likeCount: 71),
    MenuItem(id: "14", name: "Tandoori Chicken", description: "Indian spiced grilled chicken.", price: 1250.0, imagePath: "assets/images/tandoori.jpg", category: "Indian", featuredRestaurants: ["Tandoori Tales"], rating: 4.7, likeCount: 63),
    MenuItem(id: "15", name: "Paneer Tikka", description: "Grilled Indian cottage cheese skewers.", price: 950.0, imagePath: "assets/images/paneer.jpg", category: "Indian", featuredRestaurants: ["Tandoori Tales"], rating: 4.3, likeCount: 26),

    // Chinese
    MenuItem(id: "16", name: "Sweet and Sour Chicken", description: "Crispy chicken in sweet & tangy sauce.", price: 980.0, imagePath: "assets/images/sweet_sour.jpg", category: "Chinese", featuredRestaurants: ["Dragon Palace"], rating: 4.3, likeCount: 45),
    MenuItem(id: "17", name: "Vegetable Fried Rice", description: "Classic Chinese-style fried rice.", price: 750.0, imagePath: "assets/images/fried_rice.jpg", category: "Chinese", featuredRestaurants: ["Dragon Palace"], rating: 4.0, likeCount: 27),

    // Thai
    MenuItem(id: "18", name: "Green Curry", description: "Spicy Thai green curry with vegetables.", price: 1100.0, imagePath: "assets/images/green_curry.jpg", category: "Thai", featuredRestaurants: ["Thai Treat"], rating: 4.6, likeCount: 33),
    MenuItem(id: "19", name: "Pad Thai", description: "Famous Thai stir-fried noodle dish.", price: 950.0, imagePath: "assets/images/pad_thai.jpg", category: "Thai", featuredRestaurants: ["Thai Treat"], rating: 4.5, likeCount: 36),
    MenuItem(id: "20", name: "Tom Yum Soup", description: "Hot & sour Thai seafood soup.", price: 950.0, imagePath: "assets/images/tom_yum.jpg", category: "Thai", featuredRestaurants: ["Thai Treat"], rating: 4.4, likeCount: 35),

    // Desserts
    MenuItem(id: "21", name: "Watalappam", description: "Sri Lankan dessert with jaggery and coconut.", price: 450.0, imagePath: "assets/images/watalappam.jpg", category: "Desserts", featuredRestaurants: ["Rice Point"], rating: 4.9, likeCount: 55),
    MenuItem(id: "22", name: "Chocolate Lava Cake", description: "Molten-centered chocolate dessert.", price: 600.0, imagePath: "assets/images/lava_cake.jpg", category: "Desserts", featuredRestaurants: ["Rice Point"], rating: 4.9, likeCount: 47),
    MenuItem(id: "23", name: "Mango Sticky Rice", description: "Sweet mango with coconut sticky rice.", price: 700.0, imagePath: "assets/images/mango_rice.jpg", category: "Desserts", featuredRestaurants: ["Thai Treat"], rating: 4.8, likeCount: 29),
    MenuItem(id: "24", name: "Gulab Jamun", description: "Indian syrup-soaked dessert balls.", price: 500.0, imagePath: "assets/images/gulab_jamun.jpg", category: "Desserts", featuredRestaurants: ["Tandoori Tales"], rating: 4.7, likeCount: 40),
  ];

  Map<String, int> quantities = {};

  void add(String id) {
    setState(() {
      quantities[id] = (quantities[id] ?? 0) + 1;
    });
  }

  void remove(String id) {
    final qty = quantities[id] ?? 0;
    if (qty > 1) {
      setState(() {
        quantities[id] = qty - 1;
      });
    } else {
      setState(() {
        quantities.remove(id);
      });
    }
  }

  List<MenuItem> getFilteredItems() {
    return allItems.where((item) {
      final matchCategory = widget.category == null || item.category == widget.category;
      final matchRestaurant = widget.restaurant == null || item.featuredRestaurants.contains(widget.restaurant);
      return matchCategory && matchRestaurant;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = getFilteredItems();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        if (widget.category != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("${widget.category!} Menu", style: theme.textTheme.titleLarge),
          ),
        ...filtered.map((item) => buildMenuItemCard(item, theme)),
      ],
    );
  }

  Widget buildMenuItemCard(MenuItem item, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name, style: theme.textTheme.titleMedium),
                      Row(
                        children: [
                          const Icon(Icons.favorite, size: 18, color: Colors.red),
                          const SizedBox(width: 4),
                          Text("${item.likeCount}", style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item.description, style: theme.textTheme.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text("Rating: ${item.rating.toStringAsFixed(1)} ★", style: theme.textTheme.bodySmall?.copyWith(color: Colors.orange)),
                  const SizedBox(height: 4),
                  Text("Featured: ${item.featuredRestaurants.join(", ")}", style: theme.textTheme.bodySmall?.copyWith(color: Colors.blueGrey)),
                  const SizedBox(height: 4),
                  Text("Rs ${item.price.toStringAsFixed(2)}", style: theme.textTheme.bodyLarge?.copyWith(color: AppTheme.accentColor)),
                  const SizedBox(height: 8),
                  buildQuantityControls(item, theme),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQuantityControls(MenuItem item, ThemeData theme) {
    final qty = quantities[item.id] ?? 0;
    return Row(
      children: [
        if (qty > 0)
          IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () => remove(item.id)),
        Text("$qty", style: theme.textTheme.titleMedium),
        const SizedBox(width: 4),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          onPressed: () => add(item.id),
          child: Text(
            qty == 0 ? "Add" : "Add More",
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

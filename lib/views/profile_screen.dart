import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Hi Christina!", style: textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text("christina.wanigasekara@gmail.com", style: textTheme.bodyMedium),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: AppTheme.primaryColor),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(Icons.fastfood, "My Orders"),
                _buildListTile(Icons.favorite, "Favorites"),
                _buildListTile(Icons.credit_card, "Payment Methods"),
                _buildListTile(Icons.home, "My Addresses"),
                _buildListTile(Icons.settings, "Settings"),
                _buildListTile(Icons.help_outline, "Help & Support"),
                _buildListTile(Icons.info_outline, "About App"),
                _buildListTile(Icons.logout, "Log out", iconColor: Colors.red),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, {Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppTheme.primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

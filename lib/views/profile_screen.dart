import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  // Controllers to hold the editable text
  final TextEditingController _nameController = TextEditingController(text: "Hi Christina!");
  final TextEditingController _emailController = TextEditingController(text: "christina.wanigasekara@gmail.com");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    if (_isEditing) {
      // If currently editing, validate and save before toggling off edit mode
      if (_formKey.currentState?.validate() ?? false) {
        setState(() {
          _isEditing = false;
        });
        // Here you can also save the updated info to backend or local storage
      }
    } else {
      setState(() {
        _isEditing = true;
      });
    }
  }

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _isEditing
                            ? TextFormField(
                                controller: _nameController,
                                style: textTheme.titleLarge,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                ),
                                validator: (value) => (value == null || value.isEmpty) ? 'Name cannot be empty' : null,
                              )
                            : Text(_nameController.text, style: textTheme.titleLarge),
                        const SizedBox(height: 4),
                        _isEditing
                            ? TextFormField(
                                controller: _emailController,
                                style: textTheme.bodyMedium,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Email cannot be empty';
                                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                  if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
                                  return null;
                                },
                              )
                            : Text(_emailController.text, style: textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(_isEditing ? Icons.check : Icons.edit, color: AppTheme.primaryColor),
                  onPressed: _toggleEdit,
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  Icons.fastfood,
                  "My Orders",
                  onTap: () => Navigator.pushNamed(context, '/orders'),
                ),
                _buildListTile(
                  Icons.favorite,
                  "Favorites",
                  onTap: () => Navigator.pushNamed(context, '/favorites'),
                ),
                _buildListTile(
                  Icons.credit_card,
                  "Payment Methods",
                  onTap: () => Navigator.pushNamed(context, '/payments'),
                ),
                _buildListTile(
                  Icons.home,
                  "My Addresses",
                  onTap: () => Navigator.pushNamed(context, '/addresses'),
                ),
                _buildListTile(
                  Icons.settings,
                  "Settings",
                  onTap: () => Navigator.pushNamed(context, '/settings'),
                ),
                _buildListTile(
                  Icons.help_outline,
                  "Help & Support",
                  onTap: () => Navigator.pushNamed(context, '/support'),
                ),
                
                _buildListTile(
                  Icons.logout,
                  "Log out",
                  iconColor: Colors.red,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                           
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: const Text("Log out", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, {Color? iconColor, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppTheme.primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

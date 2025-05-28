import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
import 'package:swiftdine_app/screens/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    

    // Simulate loading, then navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restaurant_menu,
              color: AppTheme.backgroundColor,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Swiftdine',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              color: AppTheme.accentColor,
            ),
          ],
        ),
      ),
    );
  }
}

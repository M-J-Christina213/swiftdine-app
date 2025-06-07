import 'package:flutter/material.dart';
import 'package:swiftdine_app/themes/app_theme.dart';
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
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/home');

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
            Image.asset(
              'assets/images/swiftdine.jpg',
              width: 100,
              height: 100,
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

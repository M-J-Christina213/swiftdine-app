import 'package:flutter/material.dart';
import 'package:swiftdine_app/screens/splash_screen.dart';
import 'themes/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SwiftDineApp());
}

class SwiftDineApp extends StatelessWidget {
  const SwiftDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Swiftdine App',
        theme: AppTheme.lightTheme,
        darkTheme: ThemeData(),
        themeMode: ThemeMode.system, 
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,

    );
  }
}

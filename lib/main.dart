import 'package:flutter/material.dart';
import 'package:swiftdine_app/screens/splash_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'swiftdine App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, 
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      

    );
  }
}

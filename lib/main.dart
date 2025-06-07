import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/splash_screen.dart';
import 'themes/app_theme.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';

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
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,

    );
  }
}

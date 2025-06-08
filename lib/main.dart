import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/splash_screen.dart';
import 'themes/app_theme.dart';
import 'views/login_screen.dart';
import 'views/widgets/bottom_nav_bar.dart';
import 'package:swiftdine_app/views/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const SwiftDineApp(),
    ),
  );
}


class SwiftDineApp extends StatelessWidget {
  const SwiftDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Swiftdine App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, 
        initialRoute: '/splash',
        routes: {
          '/': (context) => const SplashScreen(),
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const BottomNavBarScreen(),
        },
        debugShowCheckedModeBanner: false,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/splash_screen.dart';
import 'themes/app_theme.dart';
import 'views/login_screen.dart';
import 'views/widgets/bottom_nav_bar.dart';
import 'package:swiftdine_app/views/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'views/orders_screen.dart';
import 'views/profile/favourites.dart';
import 'views/profile/payment_screen.dart';
import 'views/profile/address_screen.dart';
import 'views/profile/settings.dart';
import 'views/profile/support_screen.dart';
import 'views/providers/theme_proviser.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const SwiftDineApp(),
    ),
  );
}

class SwiftDineApp extends StatelessWidget {
  const SwiftDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Swiftdine App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode, 
      initialRoute: '/splash',
      routes: {
        '/': (context) => const SplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const BottomNavBarScreen(),
        '/orders': (context) => const OrderScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/payments': (context) => const PaymentsScreen(),
        '/addresses': (context) => const AddressScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/support': (context) => const SupportScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

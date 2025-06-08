import 'package:flutter/material.dart';
import 'package:swiftdine_app/views/orders/current_orders_tab.dart';
import 'package:swiftdine_app/views/orders/past_orders_tab.dart';
import 'package:swiftdine_app/themes/app_theme.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0, // Past Orders first
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
          backgroundColor: AppTheme.primaryColor,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Past Orders'),
              Tab(text: 'Current Orders'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PastOrdersTab(),
            CurrentOrdersTab(),
          ],
        ),
      ),
    );
  }
}

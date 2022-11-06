import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/dashboard_screen/delivedred_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/preparing_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/shipping_screen.dart';

class SellerOrdersScreen extends StatelessWidget {
  const SellerOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Orders',
            style: TextStyle(color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Preparing',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Shipping',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Delivered',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PreparingScreen(),
            ShippingScreen(),
            DeliveredScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/dashboard_screen/balance_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/edit_profile_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/manage_product_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/seller_orders_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/seller_store_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen/statistics_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = 'DashboardScreen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> title = [
    'My Store',
    'Orders',
    'Edit Profile',
    'Manage Products',
    'Balance',
    'Statistics',
  ];

  List<IconData> icons = [
    Icons.store,
    Icons.shop_2_outlined,
    Icons.edit,
    Icons.settings,
    Icons.attach_money,
    Icons.show_chart,
  ];

  List<Widget> pages = [
    const SellerStoreScreen(),
    const SellerOrdersScreen(),
    const EditProfileScreen(),
    const ManageProductScreen(),
    const BalanceScreen(),
    const StatisticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          children: List.generate(
            6,
            (index) => InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pages[index]));
              },
              child: Card(
                elevation: 15,
                color: Colors.blueGrey.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.cyan,
                    ),
                    Text(
                      title[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/cart_screen.dart';
import 'package:multi_vendor_01/views/category_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen.dart';
import 'package:multi_vendor_01/views/home_screen.dart';
import 'package:multi_vendor_01/views/profile_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  static const String routeName = 'SellerHomeScreen';
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  int _selectedItem = 0;

  final _pages = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const Center(child: Text('Shop Screen')),
    const DashboardScreen(),
    const Center(
      child: Text('Upload'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.cyan,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
        ],
      ),
      body: _pages[_selectedItem],
    );
  }
}

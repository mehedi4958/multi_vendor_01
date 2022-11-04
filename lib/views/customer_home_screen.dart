import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/cart_screen.dart';
import 'package:multi_vendor_01/views/category_screen.dart';
import 'package:multi_vendor_01/views/home_screen.dart';
import 'package:multi_vendor_01/views/profile_screen.dart';
import 'package:multi_vendor_01/views/store_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  static const String routeName = 'CustomerHomeScreen';
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedItem = 0;

  final _pages = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const StoreScreen(),
    const CartScreen(),
    const ProfileScreen(),
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
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_selectedItem],
    );
  }
}

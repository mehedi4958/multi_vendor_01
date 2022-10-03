import 'package:flutter/material.dart';

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
            (index) => Card(
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
    );
  }
}

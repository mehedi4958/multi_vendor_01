import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/inner_screens/search_screens.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const SearchScreen(),
                ),
              );
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.6,
                  color: Colors.cyan,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const Text(
                    'What are you looking for?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 33,
                    width: 74,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              RepeatedTab(title: 'Men'),
              RepeatedTab(title: 'Women'),
              RepeatedTab(title: 'Kids'),
              RepeatedTab(title: 'Shoes'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'Men Category',
              ),
            ),
            Center(
              child: Text(
                'Women Category',
              ),
            ),
            Center(
              child: Text(
                'Kid Category',
              ),
            ),
            Center(
              child: Text(
                'Shoe Category',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  const RepeatedTab({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }
}
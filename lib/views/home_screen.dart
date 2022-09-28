import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/inner_screens/search_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Men',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Women',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Kids',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Shoes',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
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
        ),
      ),
    );
  }
}

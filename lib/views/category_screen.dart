import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/categories/men_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  final List<ItemData> _items = [
    ItemData(categoryName: 'Men'),
    ItemData(categoryName: 'Women'),
    ItemData(categoryName: 'Kids'),
    ItemData(categoryName: 'Shoes'),
    ItemData(categoryName: 'Bags'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.2,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      _pageController.jumpToPage(index);
                    },
                    child: Container(
                      color: _items[index].isSelected == true
                          ? Colors.white
                          : Colors.grey.shade300,
                      height: 100,
                      child: Center(
                        child: Text(
                          _items[index].categoryName,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  for (var item in _items) {
                    item.isSelected = false;
                  }
                  setState(() {
                    _items[value].isSelected = true;
                  });
                },
                scrollDirection: Axis.vertical,
                children: [
                  MenCategoryScreen(),
                  Center(
                    child: Text('Women'),
                  ),
                  Center(
                    child: Text('Kids'),
                  ),
                  Center(
                    child: Text('Shoes'),
                  ),
                  Center(
                    child: Text('Bags'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemData {
  ItemData({required this.categoryName, this.isSelected = false});

  final String categoryName;
  bool isSelected;
}

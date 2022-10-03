import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/minor_screens/sub_category_screen.dart';

import '../../utilities/category_list.dart';

class MenCategoryScreen extends StatelessWidget {
  const MenCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Men',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 70,
            children: List.generate(
              men.length - 2,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SubCategoryScreen(
                            mainCategory: 'Men',
                            subCategoryName: men[index],
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/men/men$index.jpg'),
                      ),
                      Text(men[index + 1]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

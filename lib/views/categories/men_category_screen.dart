import 'package:flutter/material.dart';

class MenCategoryScreen extends StatelessWidget {
  const MenCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(25),
          child: Text(
            'Men',
            style: TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 70,
            children: List.generate(
              6,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.cyan,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

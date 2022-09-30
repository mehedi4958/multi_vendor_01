import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen(
      {Key? key, required this.subCategoryName, required this.mainCategory})
      : super(key: key);

  final String subCategoryName;
  final String mainCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(subCategoryName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(mainCategory),
      ),
    );
  }
}

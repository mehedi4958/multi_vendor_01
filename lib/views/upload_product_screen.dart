import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_01/controllers/snack_bar_controller.dart';
import 'package:multi_vendor_01/utilities/category_list.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  String mainCategoryValue = 'Select main category';
  String subCategoryValue = 'subcategory';

  List<String> subCategoryList = [];

  late double price;
  late int quantity;
  late String productName;
  late String productDescription;
  List<XFile>? imageList = [];

  void pickProductImage() async {
    try {
      final pickedImage = await _picker.pickMultiImage(
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 100,
      );
      setState(() {
        imageList = pickedImage!;
      });
    } catch (exception) {}
  }

  Widget displayImage() {
    if (imageList!.isNotEmpty) {
      return InkWell(
        onTap: () {
          setState(() {
            imageList = null;
          });
        },
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: imageList!.length,
          itemBuilder: (context, index) {
            return Image.file(File(imageList![index].path));
          },
        ),
      );
    } else {
      return const Center(
        child: Text(
          'You have not\n\nPicked any Image',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      );
    }
  }

  void selectMainCategory(String? value) {
    if (value == 'Men') {
      subCategoryList = men;
    } else if (value == 'Women') {
      subCategoryList = women;
    } else if (value == 'Accessories') {
      subCategoryList = accessories;
    } else if (value == 'Electronics') {
      subCategoryList = electronics;
    } else if (value == 'Shoes') {
      subCategoryList = shoes;
    } else if (value == 'Home & Garden') {
      subCategoryList = homeAndGarden;
    } else if (value == 'Beauty') {
      subCategoryList = beauty;
    } else if (value == 'Kids') {
      subCategoryList = kids;
    } else if (value == 'Bags') {
      subCategoryList = bags;
    }
    setState(() {
      mainCategoryValue = value!;
      subCategoryValue = 'subcategory';
    });
  }

  void uploadProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (imageList!.isNotEmpty) {
        print('$price\n$quantity\n$productName\n$productDescription');
        setState(() {
          imageList = [];
        });
        _formKey.currentState!.reset();
      } else {
        snackBar(context, 'Please, pick product image');
      }
    } else {
      snackBar(context, 'Fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: Colors.cyan,
                      child: Center(
                        child: imageList != null
                            ? displayImage()
                            : const Text(
                                'You have not\n\nPicked any Image',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Select main category'),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(50),
                            style: const TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold),
                            value: mainCategoryValue,
                            items: mainCategory
                                .map<DropdownMenuItem<String>>(
                                  (element) => DropdownMenuItem(
                                    value: element,
                                    child: Text(element),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              selectMainCategory(value);
                            },
                          ),
                          const Text('Select sub-category'),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(50),
                            style: const TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.w500),
                            value: subCategoryValue,
                            items: subCategoryList
                                .map<DropdownMenuItem<String>>(
                                  (element) => DropdownMenuItem(
                                    value: element,
                                    child: Text(element),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                subCategoryValue = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                  child: Divider(
                    color: Colors.cyan,
                    thickness: 1.6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: TextFormField(
                      onSaved: (value) {
                        price = double.parse(value!);
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Price must not be empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'Add Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Quantity must not be empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Add Quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: TextFormField(
                      onSaved: (value) {
                        productName = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Product name must not be empty';
                        } else {
                          return null;
                        }
                      },
                      maxLength: 100,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter product name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: TextFormField(
                      onSaved: (value) {
                        productDescription = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Product description must not be empty';
                        } else {
                          return null;
                        }
                      },
                      maxLength: 800,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Product Description',
                        hintText: 'Write product description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                pickProductImage();
              },
              child: const Icon(Icons.photo_library),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              uploadProduct();
            },
            child: const Icon(Icons.upload),
          ),
        ],
      ),
    );
  }
}

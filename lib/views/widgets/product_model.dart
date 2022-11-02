import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/detail/product_detail_screen.dart';

class ProductModel extends StatelessWidget {
  const ProductModel({
    Key? key,
    required this.products,
  }) : super(key: key);

  final dynamic products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const ProductDetailScreen();
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                    maxHeight: 250,
                  ),
                  child: Image.network(products['productImages'][0]),
                ),
              ),
              Text(products['productName']),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      products['price'].toString(),
                      style: const TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

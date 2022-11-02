import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final dynamic productList;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> images = productList['productImages'];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.network(images[index]);
              },
              itemCount: images.length,
              pagination: const SwiperPagination(
                builder: SwiperPagination.dots,
              ),
            ),
          ),
          Text(
            productList['productName'],
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              color: Colors.grey.shade600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'USD',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.cyan,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      productList['price'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${productList['inStock']} pieces available in stock',
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

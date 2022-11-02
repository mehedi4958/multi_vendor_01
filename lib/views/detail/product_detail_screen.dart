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
        ],
      ),
    );
  }
}

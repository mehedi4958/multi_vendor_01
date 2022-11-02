import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.network(
                    'https://www.junglescout.com/wp-content/uploads/2021/01/product-photo-water-bottle-hero.png');
              },
              itemCount: 1,
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

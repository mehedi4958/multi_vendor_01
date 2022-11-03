import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../widgets/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final dynamic productList;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> images = productList['productImages'];
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('mainCategory', isEqualTo: 'Men')
        .snapshots();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 40,
                  width: 50,
                  child: Divider(
                    color: Colors.cyan,
                    thickness: 1.6,
                  ),
                ),
                Text(
                  'Item Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 50,
                  child: Divider(
                    color: Colors.cyan,
                    thickness: 1.6,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productList['productDescription'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 40,
                  width: 50,
                  child: Divider(
                    color: Colors.cyan,
                    thickness: 1.6,
                  ),
                ),
                Text(
                  'Similar Items',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 50,
                  child: Divider(
                    color: Colors.cyan,
                    thickness: 1.6,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: StreamBuilder<QuerySnapshot>(
                stream: _productsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'This Category\n\nhas no item yet',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        crossAxisCount: 2,
                        itemBuilder: (context, int index) {
                          return ProductModel(
                              products: snapshot.data!.docs[index]);
                        },
                        staggeredTileBuilder: (context) =>
                            const StaggeredTile.fit(1)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

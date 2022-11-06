import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:badges/badges.dart';
import 'package:multi_vendor_01/views/detail/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/wishlist_provider.dart';

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
            return ProductDetailScreen(
              productList: products,
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
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
                          onPressed: () {
                            Provider.of<WishListProvider>(context,
                                            listen: false)
                                        .getWishedItems
                                        .firstWhereOrNull((product) =>
                                            product.productId ==
                                            products['productId']) !=
                                    null
                                ? context
                                    .read<WishListProvider>()
                                    .removeWished(products['productId'])
                                : Provider.of<WishListProvider>(context,
                                        listen: false)
                                    .addWishedItem(
                                    products['productName'],
                                    products['price'],
                                    1,
                                    products['inStock'],
                                    products['productImages'],
                                    products['productId'],
                                    products['sellerUid'],
                                  );
                          },
                          icon: context
                                      .watch<WishListProvider>()
                                      .getWishedItems
                                      .firstWhereOrNull((wished) =>
                                          wished.productId ==
                                          products['productId']) !=
                                  null
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 30,
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Badge(
                toAnimate: true,
                shape: BadgeShape.square,
                badgeColor: Colors.cyan,
                borderRadius: BorderRadius.circular(8),
                badgeContent: const Text(
                  'New Arrival',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

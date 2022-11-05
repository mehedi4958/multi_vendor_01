import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/wishlist_provider.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = 'WishListScreen';
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
        title: const Text(
          'Wish List',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<WishListProvider>().clearWished();
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: context.watch<WishListProvider>().getWishedItems.isNotEmpty
          ? Consumer<WishListProvider>(
              builder: (context, wishListProvider, child) {
                return ListView.builder(
                  itemCount: wishListProvider.count,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 120,
                              child: Image.network(
                                wishListProvider
                                    .getWishedItems[index].imageUrls[0]
                                    .toString(),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    wishListProvider.getWishedItems[index].name,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        wishListProvider
                                            .getWishedItems[index].price
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your wishlist is empty',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      onPressed: () {},
                      child: const Text(
                        'continue shopping',
                        style: TextStyle(
                          fontSize: 17,
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

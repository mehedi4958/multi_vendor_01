import 'package:flutter/material.dart';
import 'package:multi_vendor_01/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.count,
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
                          cartProvider.getItems[index].imageUrls[0].toString(),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              cartProvider.getItems[index].name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'Your cart is empty',
      //         style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.blueGrey,
      //         ),
      //       ),
      //       const SizedBox(height: 30),
      //       Material(
      //         color: Colors.cyan,
      //         borderRadius: BorderRadius.circular(15),
      //         child: MaterialButton(
      //           minWidth: MediaQuery.of(context).size.width * 0.6,
      //           onPressed: () {},
      //           child: const Text(
      //             'continue shopping',
      //             style: TextStyle(
      //               fontSize: 17,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total: \$',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1,
              ),
            ),
            const Text(
              '00.00',
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
                letterSpacing: 3,
              ),
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

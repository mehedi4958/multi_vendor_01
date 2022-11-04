import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _list = [];

  List<Product> get getItems {
    return _list;
  }

  int? get count {
    return _list.length;
  }

  void addItem(String name, double price, int quantity, int inStock,
      List imageUrls, String productId, String sellerUid) {
    final product = Product(
        name: name,
        price: price,
        quantity: quantity,
        inStock: inStock,
        imageUrls: imageUrls,
        productId: productId,
        sellerUid: sellerUid);
    _list.add(product);
    notifyListeners();
  }
}

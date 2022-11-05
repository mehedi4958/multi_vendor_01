import 'package:flutter/material.dart';

import '../models/product_model.dart';

class WishListProvider extends ChangeNotifier {
  final List<Product> _list = [];

  List<Product> get getWishedItems {
    return _list;
  }

  int? get count {
    return _list.length;
  }

  void addWishedItem(String name, double price, int quantity, int inStock,
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

  void clearWished() {
    _list.clear();
    notifyListeners();
  }

  void removeWished(String id) {
    _list.removeWhere((element) => element.productId == id);
    notifyListeners();
  }

  void removeWishedItem(Product product) {
    _list.remove(product);
    notifyListeners();
  }
}

class Product {
  String name;
  double price;
  int quantity;
  int inStock;
  List imageUrls;
  String productId;
  String sellerUid;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.imageUrls,
    required this.productId,
    required this.sellerUid,
  });
}

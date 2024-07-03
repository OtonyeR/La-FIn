class Product {
  final String productId;
  final String name;
  final String imageUrl;
  final String category;
  final int price;
  int quantity;

  Product(
    this.quantity, {
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'spiceId': productId,
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'price': price,
      'quantity': quantity,
    };
  }
}

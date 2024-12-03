class Product {
  final String name;
  final String category;
  final double price;
  final String image;
  final String size;
  int quantity;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.size,
    this.quantity = 1,
  });
}

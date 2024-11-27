class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String? imagePath;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imagePath,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imagePath'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'category': category,
    };
  }
}

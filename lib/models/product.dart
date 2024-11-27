class Product {
  final String id;
  final String title;
  final String description;
  final int price;
  final String category; // Thêm thuộc tính danh mục
  final String? imagePath;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category, // Yêu cầu danh mục khi tạo sản phẩm
    this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'category': category,
        'imagePath': imagePath,
      };

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      imagePath: json['imagePath'],
    );
  }
}

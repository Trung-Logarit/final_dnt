import '../models/product.dart';

class ProductService {
  static final ProductService _instance = ProductService._internal();
  factory ProductService() => _instance;
  ProductService._internal();

  final List<Product> _products = [
    Product(
      id: '1',
      title: 'Áo thun',
      description: 'Áo thun cũ, còn tốt',
      price: 100000,
      imagePath: 'assets/images/tshirt.png',
      category: 'Thời trang', // Danh mục Thời trang
    ),
    Product(
      id: '2',
      title: 'Giày thể thao',
      description: 'Giày đã qua sử dụng, giá rẻ',
      price: 250000,
      imagePath: 'assets/images/shoes.png',
      category: 'Phụ kiện', // Danh mục Phụ kiện
    ),
    Product(
      id: '3',
      title: 'Tai nghe ma só',
      description: 'Nghe hay vl',
      price: 90000,
      imagePath: null,
      category: 'Điện tử', // Danh mục Điện tử
    ),
  ];

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.add(product);
  }
}

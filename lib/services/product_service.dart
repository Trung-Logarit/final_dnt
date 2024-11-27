import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class ProductService {
  static const _productsKey = 'products_key'; // Khóa lưu trữ SharedPreferences
  final List<Product> _products = [];

  ProductService() {
    _loadProducts(); // Tự động tải sản phẩm khi khởi tạo
  }

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.add(product); // Thêm sản phẩm vào danh sách
    _saveProducts(); // Lưu danh sách sản phẩm sau khi thêm
  }

  Future<void> _saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(_products.map((product) => product.toJson()).toList());
    prefs.setString(_productsKey, jsonString);
  }

  Future<void> _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_productsKey);

    if (jsonString != null) {
      final productList = jsonDecode(jsonString) as List;
      _products.clear();
      _products.addAll(
        productList.map((productJson) => Product.fromJson(productJson)).toList(),
      );
    }
  }
}

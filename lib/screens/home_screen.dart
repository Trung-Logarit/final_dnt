import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../widgets/product_item.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService productService = ProductService();
  String selectedCategory = 'Tất cả'; // Danh mục được chọn (mặc định là "Tất cả")

  @override
  Widget build(BuildContext context) {
    final products = selectedCategory == 'Tất cả'
        ? productService.products // Hiển thị tất cả sản phẩm
        : productService.products
            .where((product) => product.category == selectedCategory)
            .toList(); // Lọc sản phẩm theo danh mục

    // Lấy danh sách danh mục từ danh sách sản phẩm
    final categories = ['Tất cả', ...{...productService.products.map((p) => p.category)}];

    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chính'),
        actions: [
          // DropdownButton để chọn danh mục
          DropdownButton<String>(
            value: selectedCategory,
            items: categories
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedCategory = value;
                });
              }
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                'Không có sản phẩm nào!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final product = products[index];
                return ProductItem(
                  title: product.title,
                  description: product.description,
                  price: product.price,
                  imagePath: product.imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add-product');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

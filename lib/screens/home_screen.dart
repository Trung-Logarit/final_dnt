import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../widgets/product_item.dart';
import 'product/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService productService = ProductService();
  String _selectedCategory = 'Tất cả'; // Danh mục mặc định

  @override
  Widget build(BuildContext context) {
    final products = _selectedCategory == 'Tất cả'
        ? productService.products
        : productService.products
            .where((product) => product.category == _selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chính'),
        actions: [
          DropdownButton<String>(
            value: _selectedCategory,
            items: ['Tất cả', 'Quần áo', 'Giày dép', 'Phụ kiện']
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
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
          setState(() {}); // Làm mới giao diện sau khi thêm sản phẩm
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    final products = productService.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chính'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Điều hướng đến trang cá nhân
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

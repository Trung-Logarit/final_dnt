import 'dart:io';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final String? imagePath;
  final VoidCallback onTap;

  const ProductItem({
    required this.title,
    required this.description,
    required this.price,
    this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: imagePath != null && imagePath!.isNotEmpty
              ? _buildImage(imagePath!) // Xử lý hiển thị hình ảnh
              : Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey[600]),
                ),
          title: Text(title),
          subtitle: Text(description),
          trailing: Text(
            '${price.toString()} VNĐ',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    if (path.startsWith('http') || path.startsWith('https')) {
      // Nếu là hình ảnh từ URL
      return Image.network(
        path,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    } else {
      // Nếu là hình ảnh từ hệ thống cục bộ
      return Image.file(
        File(path),
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
            child: Icon(Icons.broken_image, color: Colors.grey[600]),
          );
        },
      );
    }
  }
}

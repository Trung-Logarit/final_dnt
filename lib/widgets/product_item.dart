import 'package:flutter/material.dart';
import 'dart:io';

class ProductItem extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String? imagePath;
  final VoidCallback? onTap;

  const ProductItem({
    required this.title,
    required this.description,
    required this.price,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Hiển thị hình ảnh từ file hoặc từ assets
            imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imagePath!.startsWith('assets/')
                        ? Image.asset(
                            imagePath!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(imagePath!),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
            SizedBox(width: 10),
            // Hiển thị thông tin sản phẩm
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '${price.toStringAsFixed(0)} VND',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

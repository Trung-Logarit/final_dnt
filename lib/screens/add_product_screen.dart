import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../models/product.dart';
import '../services/product_service.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final ProductService productService = ProductService();
  File? _selectedImage;
  String selectedCategory = 'Thời trang'; // Danh mục mặc định

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final price = double.tryParse(_priceController.text) ?? 0;

    if (title.isEmpty || description.isEmpty || price <= 0 || _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin và chọn hình ảnh!')),
      );
      return;
    }

    final newProduct = Product(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      price: price,
      imagePath: _selectedImage?.path,
      category: selectedCategory, // Lưu danh mục được chọn
    );

    productService.addProduct(newProduct);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Tên sản phẩm'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Mô tả sản phẩm'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Giá (VNĐ)'),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                value: selectedCategory,
                items: ['Thời trang', 'Phụ kiện', 'Điện tử']
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
              SizedBox(height: 20),
              _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Text('Chưa chọn hình ảnh'),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.image),
                label: Text('Chọn hình ảnh'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text('Thêm sản phẩm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

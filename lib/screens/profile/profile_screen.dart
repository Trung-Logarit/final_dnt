import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Nguyễn Văn A'; // Tên mặc định
  String email = 'nguyen.vana@example.com'; // Email mặc định
  File? _avatarImage; // File ảnh đại diện

  // Hàm chọn ảnh từ thư viện
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
    }
  }

  // Hàm mở màn hình chỉnh sửa thông tin
  void _editProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: MediaQuery.of(ctx).viewInsets, // Đảm bảo không bị che bởi bàn phím
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Tên'),
                  controller: TextEditingController(text: name),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: TextEditingController(text: email),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Cập nhật lại thông tin
                    Navigator.of(ctx).pop(); // Đóng modal
                  },
                  child: Text('Lưu thông tin'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ sơ cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage, // Chọn ảnh mới khi bấm vào ảnh đại diện
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatarImage != null
                      ? FileImage(_avatarImage!) // Hiển thị ảnh được chọn
                      : AssetImage('assets/images/avatar_placeholder.png') as ImageProvider,
                  child: _avatarImage == null
                      ? Icon(Icons.add_a_photo, size: 24, color: Colors.grey)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Tên: $name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _editProfile, // Mở modal chỉnh sửa thông tin
                icon: Icon(Icons.edit),
                label: Text('Chỉnh sửa thông tin'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

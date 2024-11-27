import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến HomeScreen
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Đăng nhập'),
            ),
            TextButton(
              onPressed: () {
                // Hiển thị thông báo giả lập đăng ký
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Chức năng đăng ký chưa triển khai!')),
                );
              },
              child: Text('Chưa có tài khoản? Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}

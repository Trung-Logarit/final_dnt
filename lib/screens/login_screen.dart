import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý logic đăng nhập
                final email = _emailController.text;
                final password = _passwordController.text;

                if (_authService.login(email, password)) {
                  // Chuyển đến màn hình chính nếu đăng nhập thành công
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  // Hiển thị thông báo lỗi nếu đăng nhập thất bại
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Lỗi'),
                      content: Text('Email hoặc mật khẩu không đúng!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text('Đóng'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Đăng nhập'),
            ),
            TextButton(
              onPressed: () {
                // Tương lai: Chuyển đến màn hình đăng ký (nếu cần)
              },
              child: Text('Đăng ký tài khoản mới'),
            ),
          ],
        ),
      ),
    );
  }
}

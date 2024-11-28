import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home_screen.dart';
import 'my_textfield.dart';
import 'login_button.dart';
import 'square_title.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService(); // Dịch vụ xử lý đăng nhập

  // Hàm xử lý đăng nhập
  void signUserIn(BuildContext context) {
    final email = usernameController.text.trim();
    final password = passwordController.text.trim();

    // Kiểm tra email và password rỗng
    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Lỗi'),
          content: const Text('Vui lòng nhập email và mật khẩu!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
      return;
    }

    // Gọi AuthService để xử lý đăng nhập
    if (authService.login(email, password)) {
      // Chuyển đến màn hình chính nếu đăng nhập thành công
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Hiển thị thông báo lỗi nếu đăng nhập thất bại
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Lỗi'),
          content: const Text('Email hoặc mật khẩu không đúng!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // Logo
                  const Image(
                    image: AssetImage('assets/images/logo_bkdn.png'),
                    height: 100,
                  ),

                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    'Welcome to DUT Shop',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Username TextField
                  MyTextfield(
                    controller: usernameController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Password TextField
                  MyTextfield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Login Button
                  LoginButton(
                    onTap: () => signUserIn(context), // Gọi hàm xử lý đăng nhập
                  ),

                  const SizedBox(height: 30),

                  // Or continue with
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Social Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTitle(imagePath: 'assets/images/gg.png'),
                      const SizedBox(width: 25),
                      SquareTitle(imagePath: 'assets/images/fb.png'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // TODO: Thêm logic điều hướng đến trang đăng ký
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
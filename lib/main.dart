import 'package:flutter/material.dart';
import 'package:second_hand_app/screens/login_screen/login_page.dart';
import 'screens/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/product/add_product_screen.dart';

void main() {
  runApp(SecondHandApp());
}

class SecondHandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second-Hand App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Route khởi đầu
      routes: {
        '/': (ctx) => LoginScreen(), // Màn hình Đăng nhập
        '/home': (ctx) => HomeScreen(), // Màn hình chính
        '/profile': (ctx) => ProfileScreen(), // Màn hình hồ sơ cá nhân
        '/add-product': (ctx) => AddProductScreen(), // Màn hình thêm sản phẩm
      },
    );
  }
}

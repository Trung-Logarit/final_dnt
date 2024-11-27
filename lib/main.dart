import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart'; // Import màn hình hồ sơ cá nhân

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
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        '/profile': (ctx) => ProfileScreen(), // Route cho trang cá nhân
      },
    );
  }
}

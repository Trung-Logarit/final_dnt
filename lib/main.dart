import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_product_screen.dart';

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
        '/': (ctx) => LoginScreen(),
        '/home': (ctx) => HomeScreen(),
        '/add-product': (ctx) => AddProductScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ sơ cá nhân'),
      ),
      body: Center(
        child: Text('Thông tin cá nhân của bạn.'),
      ),
    );
  }
}

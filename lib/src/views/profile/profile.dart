import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      endDrawer: const Drawer(
        child: Text('data'),
      ),
      body: Center(child: Text('我的')),
    );
  }
}

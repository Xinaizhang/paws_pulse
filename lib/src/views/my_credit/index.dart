// my_credit - index.dart
import 'package:flutter/material.dart';

class MyCreditPage extends StatefulWidget {
  @override
  State<MyCreditPage> createState() => _MyCreditPageState();
}

class _MyCreditPageState extends State<MyCreditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的信誉'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '宠物知识测试功能暂未开放',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PawsPulse')),
      body: Center(
          child: ElevatedButton(
        child: Text('主页'),
        onPressed: () {
          print("主页");
        },
      )),
    );
  }
}

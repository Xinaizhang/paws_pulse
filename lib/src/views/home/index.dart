// home.dart
import 'package:flutter/material.dart';
import './page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PawsPulse',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Text('宠物身份证'),
            Container(
              height: 200,
              child: PageViewDemo(),
            ),
            ElevatedButton(
              child: Text('主页'),
              onPressed: () {
                print("主页");
              },
            ),
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PawsPulse',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            //fontFamily: 'signikaNegative',
          ),
        ),
      ),
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

// pet_encyclopedia - index.dart
import 'package:flutter/material.dart';

class PetFriendApplicationPage extends StatefulWidget {
  @override
  State<PetFriendApplicationPage> createState() => _PetFriendApplicationPageState();
}

class _PetFriendApplicationPageState extends State<PetFriendApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('宠物好友申请'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '宠物好友申请功能暂未开放',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

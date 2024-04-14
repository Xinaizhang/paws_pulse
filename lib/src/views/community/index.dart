import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('宠物社区', style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Container(
          color: Colors.amber,
          child: Text('hahah')),
    );
  }
}

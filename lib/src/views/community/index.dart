import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
      appBar: AppBar(
        title:
            const Text('宠物社区', style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [
          IconButton(
              icon: Icon(Icons.person_pin_rounded),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/my_help',
                );
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/add_help',
                );
              }),
        ],
      ),
      body: Container(
          color: Colors.amber,
          child: Text('hahah')),
    );
  }
}

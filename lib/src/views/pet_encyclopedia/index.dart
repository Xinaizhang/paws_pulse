// pet_encyclopedia - index.dart
import 'package:flutter/material.dart';

class PetEncyclopediaPage extends StatefulWidget {
  @override
  State<PetEncyclopediaPage> createState() => _PetEncyclopediaPageState();
}

class _PetEncyclopediaPageState extends State<PetEncyclopediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('宠物百科'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '宠物百科功能暂未开放',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

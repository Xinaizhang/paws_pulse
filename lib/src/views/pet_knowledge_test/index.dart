// PetKnowledgeTestPage - index.dart
import 'package:flutter/material.dart';

class PetKnowledgeTestPage extends StatefulWidget {
  @override
  State<PetKnowledgeTestPage> createState() => _PetKnowledgeTestPageState();
}

class _PetKnowledgeTestPageState extends State<PetKnowledgeTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('宠物知识测试'),
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

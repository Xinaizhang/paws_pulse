// image_recognition - index.dart
import 'package:flutter/material.dart';

class ImageRecognitionPage extends StatefulWidget {
  @override
  State<ImageRecognitionPage> createState() => _ImageRecognitionPageState();
}

class _ImageRecognitionPageState extends State<ImageRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图像识别'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '图像识别功能暂未开放',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

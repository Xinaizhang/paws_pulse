// app.dart
import 'package:flutter/material.dart';
import 'common/common.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsPulse',
      // theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
      theme: ThemeData(
        useMaterial3: true, // 配置颜色方案以匹配 Material 3 风格
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavigationIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomNavigationIndex],
      bottomNavigationBar: navigationBar(_bottomNavigationIndex, (index) {
        setState(() {
          _bottomNavigationIndex = index;
        });
      }),
    );
  }
}

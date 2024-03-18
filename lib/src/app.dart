// app.dart
import 'package:flutter/material.dart';
import 'common/common.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsPulse',
      // 设置亮色主题
      theme: ThemeData(
        // 使用 Material3 样式
        useMaterial3: true,
        // 设置主题色
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(213, 164, 0, 1),
          //seedColor: Color.fromRGBO(17, 114, 162, 1),
        ),
        // 设置全局默认字体
        fontFamily: 'notoSansSC',
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
  int _bottomNavigationIndex = 4;

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

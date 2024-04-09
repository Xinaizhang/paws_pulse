// app.dart
import 'package:flutter/material.dart';
import 'package:paws_pulse/src/views/sign_up/sign_up.dart';
import 'package:paws_pulse/src/views/views.dart';
import 'package:paws_pulse/src/common/common.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/nav': (context) => const NavPage(),
      },
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
      //home: SignInPage(),
    );
  }
}

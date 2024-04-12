// main.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'src/app.dart';

// void main() => runApp(App());
void main() {
  // 禁用 HTTPS 证书校验
  HttpOverrides.global = MyHttpOverrides();

  runApp(App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

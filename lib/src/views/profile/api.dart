import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../../common/api_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> deleteUser() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final id = await storage.read(key: 'id');

  try {
    var response = await http.delete(
      Uri.parse('${ApiConfig.baseUrl}/app/users/$id/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 204) {
      return '成功注销账户';
    } else if (response.statusCode == 403) {
      return '无权限删除此用户';
    } else if (response.statusCode == 404) {
      return '用户不存在';
    } else {
      return '删除用户时出错，请稍后重试';
    }
  } catch (e) {
    return '删除请求失败，请稍后重试';
  }
}

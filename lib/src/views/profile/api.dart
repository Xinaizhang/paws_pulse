import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../../common/api_config.dart';
import 'package:intl/intl.dart'; // Import for date formatting
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

// 根据id获取用户信息
Future<Map<String, dynamic>> getUserById() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final id = await storage.read(key: 'id');

  try {
    var response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/app/users/$id/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    var decodedResponse = utf8.decode(response.bodyBytes);
    var responseData = jsonDecode(decodedResponse);
    print("获取用户信息中......");
    print(responseData);

    // Check if the request is successful
    if (response.statusCode == 200) {
      var data = responseData['data'];

      // Parse and reformat the `created_at` field
      if (data.containsKey('created_at')) {
        DateTime createdAt = DateTime.parse(data['created_at']);
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(createdAt); // Adjust format as desired
        data['created_at'] = formattedDate;
      }

      return {
        'success': true,
        'message': '获取用户信息成功',
        'data': data,
      };
    } else {
      return {
        'success': false,
        'message': responseData['message'] ?? '获取用户信息失败',
      };
    }
  } catch (e) {
    return {
      'success': false,
      'message': '获取用户信息失败，请稍后重试',
    };
  }
}

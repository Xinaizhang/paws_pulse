// api.dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../common/api_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 上传头像的函数
Future<Map<String, dynamic>> uploadAvatar(File imageFile) async {
  final storage = FlutterSecureStorage();
  final userId = await storage.read(key: 'id');

  if (userId == null) {
    return {'success': false, 'message': '用户 ID 不存在，无法上传头像'};
  }

  try {
    var uri = Uri.parse('${ApiConfig.baseUrl}/app/upload-avatar/$userId/');
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('avatar', imageFile.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = utf8.decode(responseData);
      var data = jsonDecode(responseString);
      return {
        'success': true,
        'message': '头像上传成功',
        'data': data['data'] // 确保这里与后端返回的字段匹配
      };
    } else {
      return {'success': false, 'message': '头像上传失败，状态码：${response.statusCode}'};
    }
  } catch (e) {
    return {'success': false, 'message': '头像上传过程中出现异常: $e'};
  }
}

// 上传背景图的函数
Future<Map<String, dynamic>> uploadBackground(File imageFile) async {
  final storage = FlutterSecureStorage();
  final userId = await storage.read(key: 'id');

  if (userId == null) {
    return {'success': false, 'message': '用户 ID 不存在，无法上传背景图'};
  }

  try {
    var uri = Uri.parse('${ApiConfig.baseUrl}/app/upload-background/$userId/'); // 注意 API URL 的变化
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('background', imageFile.path)); // 文件字段名可能需要根据后端期望进行调整

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = utf8.decode(responseData);
      var data = jsonDecode(responseString);
      return {
        'success': true,
        'message': '背景图上传成功',
        'data': data['data']  // 确保这里与后端返回的字段匹配
      };
    } else {
      return {'success': false, 'message': '背景图上传失败，状态码：${response.statusCode}'};
    }
  } catch (e) {
    return {'success': false, 'message': '背景图上传过程中出现异常: $e'};
  }
}

// 更新用户信息的函数
Future<Map<String, dynamic>> updateUserInfo(Map<String, dynamic> userInfo) async {
  final storage = FlutterSecureStorage();
  final userId = await storage.read(key: 'id');

  if (userId == null) {
    return {'success': false, 'message': '认证失败，无法更新信息'};
  }

  try {
    var uri = Uri.parse('${ApiConfig.baseUrl}/app/update-user/$userId/');
    var response = await http.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userInfo),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return {'success': true, 'message': '用户信息更新成功', 'data': data};
    } else {
      return {'success': false, 'message': '更新失败，状态码：${response.statusCode}'};
    }
  } catch (e) {
    return {'success': false, 'message': '更新过程中出现异常: $e'};
  }
}


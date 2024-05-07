// sign_in/api.dart
import '../../common/api_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<Map<String, dynamic>> loginUser(
    String identifier, String password) async {
  try {
    var response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/app/login/'),
      body: {'identifier': identifier, 'password': password},
    );

    // Decode the response body
    var decodedResponse = utf8.decode(response.bodyBytes);
    var responseData = jsonDecode(decodedResponse);
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(responseData);

    if (response.statusCode == 200) {
      // Login successful, return the data
      return {
        'success': true,
        'message': '登录成功',
        'data': responseData['data'],
      };
    } else {
      // Login failed, return an error message
      return {
        'success': false,
        'message': responseData['message'] ?? '登录失败',
      };
    }
  } catch (e) {
    // Error occurred during the request
    return {
      'success': false,
      'message': '登录请求失败，请稍后重试',
    };
  }
}

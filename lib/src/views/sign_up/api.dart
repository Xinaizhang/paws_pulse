// sign_up/api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../common/api_config.dart';

Future<String> sendVerificationCode(String email) async {
  try {
    // 发送 POST 请求
    var response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/app/send_verification_code/'),
      body: {'email': email},
    );

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(response.body);

    // 解码响应数据
    var decodedResponse = utf8.decode(response.bodyBytes);
    print(decodedResponse);

    // 解析响应数据
    Map<String, dynamic> responseData = json.decode(decodedResponse);
    return responseData['message']; // 返回消息
  } catch (e) {
    // 发送请求时出错，返回异常消息
    return '发送请求时出错,请稍后重试';
  }
}

Future<String> registerUser(String username, String email, String password,
    String verificationCode) async {
  try {
    var response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/app/register/'),
      body: {
        'username': username,
        'email': email,
        'password': password,
        'verification_code': verificationCode,
        'nickname': username
      },
    );

    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(response.body);

    // 解码响应数据
    var decodedResponse = utf8.decode(response.bodyBytes);
    print(decodedResponse);

    if (response.statusCode == 400) {
      return '验证码不正确，注册失败';
    } else if (response.statusCode == 201) {
      return '恭喜！您已成功注册账号！';
    } else {
      return '注册时出错，请稍后重试';
    }
  } catch (e) {
    return '注册时出错，请稍后重试';
  }
}

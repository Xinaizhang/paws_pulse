// sign_in/index.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../common/alert_dialog.dart';
import 'api.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  final storage = FlutterSecureStorage(); // To store secure data

  Future<void> handleLogin() async {
    print("点击登录按钮");
    String identifier = identifierController.text.trim();
    String password = passwordController.text.trim();

    // Validate input
    if (identifier.isEmpty || password.isEmpty || password.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          title: '请输入有效的用户名或邮箱及密码',
          buttonText: '好的',
        ),
      );
      return;
    }

    // Attempt login via API
    var result = await loginUser(identifier, password);

    if (result['success']) {
      // Save tokens securely
      Map<String, dynamic> userData = result['data'];
      await storage.write(key: 'access_token', value: userData['access']);
      await storage.write(key: 'refresh_token', value: userData['refresh']);
      await storage.write(key: 'id', value: userData['id'].toString());
      await storage.write(key: 'nickname', value: userData['nickname']);
      await storage.write(key: 'email', value: userData['email']);

      Map<String, String> data = await storage.readAll();
      print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
      print(data);

      // Navigate to the main page or dashboard after successful login
      Navigator.pushNamed(context, '/nav',
          arguments: {"userName": userData['nickname']});
    } else {
      // Show error message if login failed
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          title: result['message'],
          buttonText: '好的',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    Color backgroundColor = Theme.of(context).colorScheme.secondaryContainer;
    
    // 表单
    Widget _buildForm() {
      return Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.85),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              // 用户名或邮箱
              TextFormField(
                controller: identifierController,
                decoration: InputDecoration(
                  labelText: '用户名 / 邮箱',
                  hintText: '请输入用户名或邮箱',
                  prefixIcon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
        
              // 密码框
              TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  setState(() {});
                },
                obscureText: !_passwordVisible, // 使用_passwordVisible控制
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '密码至少6位',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (passwordController.text.length >= 6)
                        Icon(Icons.done, color: Colors.green), // 显示"done"图标
                      IconButton(
                        icon: Icon(
                          // 根据_passwordVisible的值切换图标
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible; // 切换密码可见性
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          // 在此处添加忘记密码的操作
                        },
                        icon: Text(
                          "忘记密码？",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // 登陆注册按钮
              Row(
                children: [
                  // 登录按钮
                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       String username = identifierController.text.trim();
                  //       String password = passwordController.text.trim();

                  //       if (username.isEmpty) {
                  //         // 如果用户名为空，显示提示弹窗
                  //         showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) =>
                  //               CustomAlertDialog(
                  //             title: '请输入用户名或邮箱',
                  //             buttonText: '好的',
                  //           ),
                  //         );
                  //       } else if (password.isEmpty) {
                  //         // 如果密码为空，显示提示弹窗
                  //         showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) =>
                  //               CustomAlertDialog(
                  //             title: '请输入密码',
                  //             buttonText: '好的',
                  //           ),
                  //         );
                  //       } else if (password.length < 6) {
                  //         // 如果密码长度不足6位，显示提示弹窗并清空密码输入框
                  //         showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) =>
                  //               CustomAlertDialog(
                  //             title: '密码不符合规范，请重新输入密码',
                  //             buttonText: '好的',
                  //           ),
                  //         );
                  //         passwordController.clear();
                  //       } else {
                  //         // 如果用户名和密码都填写了，导航到下一个页面，并传递用户名作为userId参数
                  //         Navigator.pushNamed(
                  //           context,
                  //           '/nav',
                  //           arguments: {"userName": username},
                  //         );
                  //       }
                  //     },
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all<Color>(
                  //         Theme.of(context)
                  //             .colorScheme
                  //             .primary
                  //             .withOpacity(0.8),
                  //       ),
                  //       foregroundColor: MaterialStateProperty.all<Color>(
                  //         Theme.of(context).colorScheme.onPrimary,
                  //       ),
                  //       overlayColor: MaterialStateProperty.all<Color>(
                  //         Theme.of(context).colorScheme.primary,
                  //       ),
                  //       padding: MaterialStateProperty.all<EdgeInsets>(
                  //         EdgeInsets.all(17),
                  //       ),
                  //     ),
                  //     child: Text('登录', style: TextStyle(fontSize: 16)),
                  //   ),
                  // ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: handleLogin,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(17)),
                      ),
                      child: const Text('登录', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(width: 20),
                  // 注册按钮
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/sign_up',
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(17),
                        ),
                      ),
                      child: Text('注册', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: statusBarHeight + 40),
                // logo
                Text('Welcome to',
                    style: Theme.of(context).textTheme.headlineMedium),
                Image.asset(
                  'assets/images/logo5.png',
                  height: 170,
                ),
                SizedBox(height: 30),

                // 表单
                _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

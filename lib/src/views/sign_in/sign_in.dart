import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.secondaryContainer;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(38.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Welcome to',
                  style: Theme.of(context).textTheme.headlineMedium),
              Image.asset(
                'assets/images/logo5.png',
                width: 255,
                height: 255,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        String username = usernameController.text.trim();
                        String password = passwordController.text.trim();

                        if (username.isEmpty || password.isEmpty) {
                          // 如果用户名或密码为空，显示提示弹窗
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('请输入用户名和密码',
                                    style: TextStyle(fontSize: 16)),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // 如果用户名和密码都填写了，导航到下一个页面，并传递用户名作为userId参数
                          Navigator.pushNamed(
                            context,
                            '/nav',
                            arguments: {"userName": username},
                          );
                        }
                      },
                      child: Text('登录', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(width: 20),
                  // 注册按钮
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/signUp',
                        );
                      },
                      child: Text('注册', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

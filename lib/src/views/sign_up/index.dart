// sign_up/index.dart
import 'package:flutter/material.dart';
import 'dart:async';
import '../../common/alert_dialog.dart';
import 'api.dart'; 

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // 确保TextEditingController在Widget生命周期内持续存在
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  Timer? _timer;
  int _countDown = 0; // 初始倒计时为0

  @override
  void dispose() {
    // 在Widget销毁时，清理控制器资源
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.secondaryContainer;
    
    // 修改发送验证码按钮部分的代码
    IconButton sendVerificationCodeButton = IconButton(
      onPressed: () async {
        String email = emailController.text.trim();
        if (email.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomAlertDialog(
              title: '请输入邮箱',
              buttonText: '好的',
            ),
          );
        } else {
          // 如果倒计时尚未结束，则直接返回
          if (_timer != null && _timer!.isActive) return;

          // 设置倒计时为30秒
          _countDown = 30;

          // 启动计时器，开始倒计时
          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            setState(() {
              if (_countDown > 0) {
                _countDown--;
              } else {
                // 倒计时结束，取消计时器
                _timer!.cancel();
                _countDown = 0; // 重置倒计时时间
                _timer = null; // 设置计时器为空，等待下一次点击重新创建计时器
              }
            });
          });

          // 调用发送验证码的函数
          String message = await sendVerificationCode(email);

          // 显示消息对话框
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomAlertDialog(
              title: message,
              buttonText: '好的',
            ),
          );
        }
      },
      icon: Text(
        _countDown > 0 ? '请$_countDown秒后重试 ' : '发送验证码 ',
        style: TextStyle(
          color: _countDown > 0 ? Colors.grey : Colors.blue,
          fontSize: 12,
        ),
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
    );
    // 表单
    Widget _buildForm() {
      return Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.75),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              // 用户名或邮箱
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  prefixIcon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // 邮箱
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '邮箱',
                  hintText: '请输入邮箱',
                  prefixIcon: Icon(Icons.mail_outlined),
                  suffixIcon: sendVerificationCodeButton,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // 验证码
              TextFormField(
                controller: verificationCodeController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: '验证码',
                  hintText: '请输入6位验证码',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: verificationCodeController.text.length == 6
                      ? Icon(Icons.done, color: Colors.green)
                      : SizedBox.shrink(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // 密码框
              TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  setState(() {});
                },
                obscureText: !_passwordVisible, // 使用_passwordVisible控制
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码(至少6位)',
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
                    ],
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // 确认密码框
              TextFormField(
                controller: confirmPasswordController,
                onChanged: (value) {
                  setState(() {});
                },
                obscureText:
                    !_confirmPasswordVisible, // 使用_confirmPasswordVisible控制
                decoration: InputDecoration(
                  labelText: '确认密码',
                  hintText: '请再次输入密码',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ((passwordController.text ==
                              confirmPasswordController.text) &&
                          passwordController.text.length >= 6)
                        Icon(Icons.done, color: Colors.green), // 显示"done"图标
                      IconButton(
                        icon: Icon(
                          // 根据_confirmPasswordVisible的值切换图标
                          _confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible =
                                !_confirmPasswordVisible; // 切换密码可见性
                          });
                        },
                      ),
                    ],
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // 注册按钮
              Row(
                children: [
                  // 注册按钮
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        String username = usernameController.text.trim();
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        String verificationCode =
                            verificationCodeController.text.trim();
                        String confirmPassword =
                            confirmPasswordController.text.trim();
                        String message = await registerUser(
                          username,
                          email,
                          password,
                          verificationCode,
                        );

                        if (username.isEmpty) {
                          // 如果用户名为空，显示提示弹窗
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '请输入用户名',
                              buttonText: '好的',
                            ),
                          );
                        } else if (email.isEmpty) {
                          // 如果密码为空，显示提示弹窗
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '请输入邮箱',
                              buttonText: '好的',
                            ),
                          );
                        } else if (password.isEmpty ||
                            confirmPassword.isEmpty) {
                          // 如果密码或确认密码为空，显示提示弹窗
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '密码或确认密码不能为空',
                              buttonText: '好的',
                            ),
                          );
                        } else if (password.length < 6) {
                          // 如果密码长度不足6位，显示提示弹窗并清空密码输入框
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '密码不符合规范，请重新输入密码',
                              buttonText: '好的',
                            ),
                          );
                          passwordController.clear();
                          confirmPasswordController.clear();
                        } else if (password != confirmPassword) {
                          // 如果密码和确认密码不一致，显示提示弹窗
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '密码和确认密码不一致',
                              buttonText: '好的',
                            ),
                          );
                          confirmPasswordController.clear();
                        } else if (message == '恭喜！您已成功注册账号！') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: '恭喜！您已成功注册账号！',
                              buttonText: '去登录',
                              onPressed: () {
                                // 先关闭弹窗
                                Navigator.of(context).pop();
                                // 然后跳转到登录页面
                                Navigator.pushNamed(
                                  context,
                                  '/',
                                  arguments: {"userName": username},
                                );
                              },
                            ),
                          );
                        } else {
                          // 显示错误消息
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialog(
                              title: message,
                              buttonText: '好的',
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.8),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.tertiary,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(17),
                        ),
                      ),
                      child: Text('注册账号', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ));
    }


    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          shadowColor: Theme.of(context).colorScheme.onSecondaryContainer,
          title: const Text(
            '注册账号',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              //fontFamily: 'signikaNegative',
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  ClipRRect(
                    //是ClipRRect，不是ClipRect
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo4.jpg',
                      height: 70,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('———您最贴心的智能化宠物管家———',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      )),
                  SizedBox(height: 10),
                  _buildForm(),
                ],
              )),
            )));
  }
}
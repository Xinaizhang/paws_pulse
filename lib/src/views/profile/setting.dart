// setting.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './api.dart';

class Setting extends StatelessWidget {
  const Setting({
    super.key,
  });

  Future<void> handleDeleteAccount(BuildContext context) async {
    print("点击注销用户按钮");
    // Read the user ID from secure storage
    final storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'id');
    // Debug print to verify if user ID is retrieved
    print('Retrieved user ID: $userId');

    Map<String, String> data = await storage.readAll();
    print(data);

    if (userId != null) {
      // Call the API to delete the user
      String result = await deleteUser();

      // Show a message and navigate based on the result
      if (result == '用户账户成功删除') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result)),
        );
        // Clear secure storage after deleting the user
        await storage.deleteAll();
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/sign_in',
          (route) => false,
        );
      } else {
        // Show the error message as a snack bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('未找到用户ID')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('设置',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('账户与安全'),
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('帮助与客服'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('鼓励一下'),
                    ),
                    ListTile(
                      leading: Icon(Icons.pets),
                      title: Text('关于PawsPulse'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // 清除缓存
                      final storage = FlutterSecureStorage();
                      await storage.deleteAll();

                      // Debug check if data is removed
                      Map<String, String> data = await storage.readAll();
                      print(data); // Should print an empty map
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign_in', (route) => false);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(18),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // 设置圆角的大小
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text('退出登录'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => handleDeleteAccount(context),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(18),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // 设置圆角的大小
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red[400],
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '注销账号',
                          style: TextStyle(color: Colors.red[400]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

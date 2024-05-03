import 'package:flutter/material.dart';
import 'edit_pop.dart';

class ProfileModifyPage extends StatefulWidget {
  @override
  State<ProfileModifyPage> createState() => _ProfileModifyPageState();
}

class _ProfileModifyPageState extends State<ProfileModifyPage> {
  // mockData
  final Map<String, dynamic> mockData = {
    'user_id': 1,
    'nickname': 'Jun',
    'email': 'scoups@example.com',
    'phone_number': '1234567891',
    'password': '123456',
    'created_at': '2024-01-01',
    'avatar': 'http://gallery.pawspulse.top/pawspulse/orange.png',
    'address': '广东省广州市',
    'signature': '这个人很懒，什么都没留下',
    'background': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑个人资料'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 头像
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(mockData['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),

            // 昵称 - 点击后出现“编辑昵称”弹窗，用户输入修改后的昵称，底部有两个按钮：取消、保存
            EditableField(
              label: '昵称',
              initialValue: mockData['nickname'],
              onSave: (newValue) {
                setState(() {
                  mockData['nickname'] = newValue;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),

            // 个性签名
            EditableField(
              label: '个性签名',
              initialValue: mockData['signature'],
              onSave: (newValue) {
                setState(() {
                  mockData['signature'] = newValue;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),

            // 邮箱
            EditableField(
              label: '邮箱',
              initialValue: mockData['email'],
              onSave: (newValue) {
                setState(() {
                  mockData['email'] = newValue;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            // 手机号
            EditableField(
              label: '手机号',
              initialValue: mockData['phone_number'],
              onSave: (newValue) {
                setState(() {
                  mockData['phone_number'] = newValue;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),

            // 地址
            EditableField(
              label: '地址',
              initialValue: mockData['address'],
              onSave: (newValue) {
                setState(() {
                  mockData['address'] = newValue;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),

            // 创建时间
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('创建时间',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                Row(
                  children: [
                    Text(mockData['created_at']),
                    SizedBox(width: 24),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),

            // 背景图
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('背景图',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        mockData['background'],
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.5),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 18),
            // 保存按钮
            ElevatedButton(
              onPressed: () {
                // 保存按钮的点击事件
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

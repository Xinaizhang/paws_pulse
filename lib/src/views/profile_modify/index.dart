// profile_modify_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'edit_pop.dart';
import 'upload_avatar.dart';
import 'upload_background.dart';
import 'address_picker.dart';
import './api.dart';
import '../profile/api.dart';

class ProfileModifyPage extends StatefulWidget {
  @override
  State<ProfileModifyPage> createState() => _ProfileModifyPageState();
}

class _ProfileModifyPageState extends State<ProfileModifyPage> {
  Map<String, dynamic> userData = {
    'id': '',
    'nickname': '',
    'email': '',
    'phone_number': '',
    'created_at': '',
    'avatar': '',
    'address': '',
    'signature': '这个人很懒，什么都没留下',
    'background': 'http://gallery.pawspulse.top/pawspulse/orange.png', // 默认值
  };
  bool isLoading = true; // 新增一个状态用来检查是否在加载数据

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    var response = await getUserById();
    if (response['success']) {
      var data = response['data'];
      setState(() {
        userData = {
          'id': data['id'].toString(),
          'nickname': data['nickname'] ?? '',
          'email': data['email'] ?? '',
          'phone_number': data['phone_number'] ?? '',
          'created_at': data['created_at'] ?? '',
          'avatar': data['avatar'] ??
              'http://gallery.pawspulse.top/pawspulse/orange.png',
          'address': data['address'] ?? '',
          'signature': data['signature'] ?? '这个人很懒，什么都没留下',
          'background': data['background'] ??
              'http://gallery.pawspulse.top/pawspulse/orange.png',
        };
        isLoading = false; // 设置加载状态为完成
      });
      print("获取用户信息成功");
      print(userData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? '获取用户信息失败')),
      );
      setState(() {
        isLoading = false; // 即使加载失败，也需要更新加载状态
      });
    }
  }

  void _onAvatarUploaded(String newAvatarUrl) {
    setState(() {
      userData['avatar'] = newAvatarUrl;
    });
  }

  void _onSavePressed() async {
    var response = await updateUserInfo({
      'email': userData['email'],
      'nickname': userData['nickname'],
      'address': userData['address'],
      'phone_number': userData['phone_number'],
      'signature': userData['signature'],
    });
    if (response['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('更新成功!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? '更新失败')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑个人资料'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : buildProfileForm(),
    );
  }

  Widget buildProfileForm() {
    return SingleChildScrollView(
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
                UploadAvatar(
                  avatarUrl: userData['avatar'],
                  onAvatarUploaded: _onAvatarUploaded,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // 昵称
          EditableField(
            label: '昵称',
            initialValue: userData['nickname'],
            onSave: (newValue) {
              setState(() {
                userData['nickname'] = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 个性签名
          EditableField(
            label: '个性签名',
            initialValue: userData['signature'],
            onSave: (newValue) {
              setState(() {
                userData['signature'] = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 邮箱
          EditableField(
            label: '邮箱',
            initialValue: userData['email'],
            onSave: (newValue) {
              setState(() {
                userData['email'] = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 手机号
          EditableField(
            label: '手机号',
            initialValue: userData['phone_number'],
            onSave: (newValue) {
              setState(() {
                userData['phone_number'] = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 地址
          AddressPicker(
            initialAddress: userData['address'],
            onAddressChanged: (newAddress) {
              setState(() {
                userData['address'] = newAddress;
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 创建时间
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('创建时间',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              Row(
                children: [
                  Text(userData['created_at']),
                  const SizedBox(width: 24),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),

          // 背景图
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('背景图',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              Row(
                children: [
                  UploadBackground(
                    backgroundUrl: userData['background'],
                    onBackgroundUploaded: (newUrl) {
                      setState(() {
                        userData['background'] = newUrl;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),

          // 按钮行：修改密码、保存
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 修改密码按钮的点击事件
                  },
                  child: const Text('修改密码'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onSavePressed,
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

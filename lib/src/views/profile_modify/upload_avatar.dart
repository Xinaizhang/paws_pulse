// profile_modify/upload_avatar.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../common/api_config.dart';

class UploadAvatar extends StatefulWidget {
  final String avatarUrl;
  final Function(String) onAvatarUploaded;

  const UploadAvatar({required this.avatarUrl, required this.onAvatarUploaded, Key? key}) : super(key: key);

  @override
  _UploadAvatarState createState() => _UploadAvatarState();
}

class _UploadAvatarState extends State<UploadAvatar> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('从图库选择'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: Icon(Icons.add_a_photo_rounded),
                title: Text('使用相机拍照'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _uploadAvatar();
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _uploadAvatar();
    }
  }

  Future<void> _uploadAvatar() async {
    if (_image == null) return;

    final userId = 1; // 使用真实用户 ID
    final uri = Uri.parse('${ApiConfig.baseUrl}/app/upload-avatar/$userId/');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('avatar', _image!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      final responseBody = json.decode(responseData.body);
      String newAvatarUrl = responseBody['data']['avatar'];
      widget.onAvatarUploaded(newAvatarUrl);
      print('头像上传成功: ${responseBody['message']}');
    } else {
      print('头像上传失败: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _image != null ? FileImage(_image!) : NetworkImage(widget.avatarUrl) as ImageProvider,
      ),
    );
  }
}

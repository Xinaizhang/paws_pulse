// upload_avatar.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'api.dart';

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
  bool _isLoading = false; // 加载状态标志

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
    setState(() => _isLoading = true); // 开始上传时显示加载指示器
    final result = await uploadAvatar(_image!);
    if (result['success']) {
      String newAvatarUrl =
          result['data']['avatar']; // 注意这里使用 'avatar' 而不是 'avatarUrl'
      widget.onAvatarUploaded(newAvatarUrl);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['message'])));
    }
    setState(() => _isLoading = false); // 上传结束后隐藏加载指示器
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _image != null ? FileImage(_image!) : NetworkImage(widget.avatarUrl) as ImageProvider,
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : null, // 如果正在加载，显示加载指示器
      ),
    );
  }
}

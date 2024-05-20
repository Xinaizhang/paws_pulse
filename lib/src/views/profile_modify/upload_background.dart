import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'api.dart'; // Ensure this import points to the file containing uploadBackground function.

class UploadBackground extends StatefulWidget {
  final String backgroundUrl;
  final Function(String) onBackgroundUploaded;

  const UploadBackground({
    Key? key,
    required this.backgroundUrl,
    required this.onBackgroundUploaded,
  }) : super(key: key);

  @override
  _UploadBackgroundState createState() => _UploadBackgroundState();
}

class _UploadBackgroundState extends State<UploadBackground> {
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
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('使用相机拍照'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _uploadBackground();
    }
  }

  Future<void> _uploadBackground() async {
    if (_image == null) return;
    final result = await uploadBackground(_image!);
    if (result['success']) {
      // Ensure that the background URL is correctly updated and communicated back
      widget.onBackgroundUploaded(result['data']['background']);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _image != null
            ? Image.file(
                _image!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            : Image.network(
                widget.backgroundUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

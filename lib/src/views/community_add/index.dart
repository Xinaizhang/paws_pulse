import 'dart:io';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/alert_dialog.dart';
import './add_tag.dart';

class AddCommunityPage extends StatefulWidget {
  @override
  State<AddCommunityPage> createState() => _AddCommunityPageState();
}

class _AddCommunityPageState extends State<AddCommunityPage> {
  List<int> selectedTagIndexes = [0];

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final ImagePicker _picker = ImagePicker(); // Image picker instance
  List<File> _images = []; // List to store multiple images

  // Function to show bottom sheet
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
                    _pickImageFromGallery(); // Method to handle gallery selection
                  }),
              ListTile(
                leading: Icon(Icons.add_a_photo_rounded),
                title: Text('使用相机拍照'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromCamera(); // Method to handle camera
                },
              ),
            ],
          ),
        );
      },
    );
  }

// Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path)); // Add image to the list
      });
    }
  }

// Function to take a photo using camera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path)); // Add image to the list
      });
    }
  }

  // Function to remove image from the list
  void _removeImage(File image) {
    setState(() {
      _images.remove(image); // Remove image from the list
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布帖子", style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.emoji_objects),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomAlertDialog(
                    title: '发帖小贴士',
                    buttonText: '我知道啦',
                  ),
                );
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10.0, // Spacing between images
                      runSpacing: 10.0, // Spacing between rows
                      children: _images.map((image) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width:
                                  (((MediaQuery.of(context).size.width - 40) /
                                          3) -
                                      10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1, // Aspect ratio 1:1
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removeImage(image); // Remove the image
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // 选择图片按钮
              if (_images.length < 6) // Check if user can add more images
                IconButton.outlined(
                  icon: Icon(
                    Icons.add_photo_alternate_rounded,
                    size: 35,
                  ),
                  onPressed: _showImagePickerOptions,
                ),
              SizedBox(height: 20),

              // 标题输入框
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: '请输入标题:',
                  filled: true,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 加粗
                  fontSize: 18, // 字号加大
                ),
                maxLines: 1,
                maxLength: 30, // Limit maximum characters
              ),
              SizedBox(height: 10),

              // tag选择器
              AddTag(
                tags: ['领养', '救援', '分享', '教程'],
                selectedTagIndexes: selectedTagIndexes,
                onTagSelected: (index) {
                  setState(() {
                    selectedTagIndexes = [index];
                  });
                },
              ),

              // 正文输入框
              TextField(
                controller: bodyController, // 传入bodyController
                decoration: InputDecoration(
                  hintText: '请输入帖子内容...',
                  border: InputBorder.none,
                ),
                maxLines: 13,
                maxLength: 600, // Limit maximum characters
              ),
              SizedBox(height: 20),

              // 发布按钮
              ElevatedButton(
                onPressed: () {},
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
                      borderRadius: BorderRadius.circular(14), // 设置圆角的大小
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send_rounded,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '发布',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

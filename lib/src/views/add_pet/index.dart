import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../common/index.dart';

class AddPetPage extends StatefulWidget {
  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  String petName = '';
  String petType = '';
  String sexType = '';
  String sterilization = '';
  DateTime? selectedDate;
  File? _petImage;
  final ImagePicker _picker = ImagePicker();

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
                    _pickImageFromGallery();
                  }),
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

  // Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _petImage = File(pickedFile.path);
      });
    }
  }

  // Function to take a photo using camera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _petImage = File(pickedFile.path);
      });
    }
  }

  // Function to remove the image
  void _removeImage() {
    setState(() {
      _petImage = null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 217, 97, 1),
        elevation: 0, // 阴影设置为0
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetImages.addPetBackground,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('请完善宠物信息',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(height: 6),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 昵称
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '昵称',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '请输入宝宝的昵称',
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                petName = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 种类
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '种类',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: '猫',
                                groupValue: petType,
                                activeColor: Color.fromARGB(255, 0, 70, 190),
                                onChanged: (value) {
                                  setState(() {
                                    petType = value ?? '';
                                  });
                                },
                              ),
                              Text(
                                '猫猫',
                                style: TextStyle(
                                  color: petType == '猫'
                                      ? Color.fromARGB(255, 0, 70, 190)
                                      : null,
                                ),
                              ),
                              SizedBox(width: 40),
                              Radio<String>(
                                value: '狗',
                                groupValue: petType,
                                activeColor: Colors.brown,
                                onChanged: (value) {
                                  setState(() {
                                    petType = value ?? '';
                                  });
                                },
                              ),
                              Text(
                                '狗狗',
                                style: TextStyle(
                                  color: petType == '狗' ? Colors.brown : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 生日
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '生日',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context),
                              ),
                              selectedDate != null
                                  ? Text(
                                      '${selectedDate?.year} - ${selectedDate?.month} - ${selectedDate?.day}')
                                  : Text('请选择'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 性别
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '性别',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: '男',
                                groupValue: sexType,
                                activeColor: Colors.blueAccent,
                                onChanged: (value) {
                                  setState(() {
                                    sexType = value ?? '';
                                  });
                                },
                              ),
                              Text(
                                '男',
                                style: TextStyle(
                                  color:
                                      sexType == '男' ? Colors.blueAccent : null,
                                ),
                              ),
                              SizedBox(width: 60),
                              Radio<String>(
                                value: '女',
                                groupValue: sexType,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value) {
                                  setState(() {
                                    sexType = value ?? '';
                                  });
                                },
                              ),
                              Text(
                                '女',
                                style: TextStyle(
                                  color:
                                      sexType == '女' ? Colors.pinkAccent : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 绝育情况 - 未绝育、已绝育、未知
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '绝育情况',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 设置滚动方向为水平
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: '未绝育',
                                  groupValue: sterilization,
                                  activeColor: Colors.red[300],
                                  onChanged: (value) {
                                    setState(() {
                                      sterilization = value ?? '';
                                    });
                                  },
                                ),
                                Text(
                                  '未绝育',
                                  style: TextStyle(
                                    color: sterilization == '未绝育'
                                        ? Colors.red[300]
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Radio<String>(
                                  value: '已绝育',
                                  groupValue: sterilization,
                                  activeColor: Colors.green[300],
                                  onChanged: (value) {
                                    setState(() {
                                      sterilization = value ?? '';
                                    });
                                  },
                                ),
                                Text(
                                  '已绝育',
                                  style: TextStyle(
                                    color: sterilization == '已绝育'
                                        ? Colors.green[300]
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Radio<String>(
                                  value: '未知',
                                  groupValue: sterilization,
                                  activeColor: Colors.grey,
                                  onChanged: (value) {
                                    setState(() {
                                      sterilization = value ?? '';
                                    });
                                  },
                                ),
                                Text(
                                  '未知',
                                  style: TextStyle(
                                    color: sterilization == '未知'
                                        ? Colors.grey
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),

                    // 上传照片
                    Row(
                      children: [
                        SizedBox(
                          height: 42,
                          width: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '上传照片',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              _petImage != null
                                  ? Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: FileImage(_petImage!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: _removeImage,
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
                                        ),
                                      ],
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.add_photo_alternate_rounded,
                                        size: 35,
                                      ),
                                      onPressed: _showImagePickerOptions,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.verified_user_rounded,
          size: 20.0,
        ),
        label: Text(
          '领取宠物身份证',
          style: TextStyle(fontSize: 18, letterSpacing: 1),
        ),
        extendedPadding: EdgeInsets.symmetric(horizontal: 110),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // 将悬浮按钮置于底部中央
    );
  }
}

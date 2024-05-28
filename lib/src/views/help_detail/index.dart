// help_detail.dart
import 'package:flutter/material.dart';
import './title.dart';
import './owner.dart';
import '../../common/pet_id_card.dart';

class HelpDetailPage extends StatefulWidget {
  @override
  State<HelpDetailPage> createState() => _HelpDetailPageState();
}

class _HelpDetailPageState extends State<HelpDetailPage> {
  final Map<String, dynamic> data = {
    'name': '大黄黄',
    'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
    'petType': 1, // 0-猫，1-狗
    'gender': 0, // 0-女，1-男
    'breed': '拉布拉多',
    'birthDate': '2020-05-01',
    'age': '3年',
    'address': '上海市浦东新区',
    'petId': '123456202005011234',
    'isQr': false,
  };

  final String helpDetails = '''
遛狗时间和频率：
- 日期和时间：4月12日至6月1日，每个工作日下午4:00
- 频率：一天一次，每次30分钟

地点信息：
- 遛狗地点：市中心公园
- 集合地点：公园南门入口

额外说明：
- 请在遇到其他大型狗时使用短绳控制。
- 紧急联系方式将在确认后提供。

联系方式：私信或联系电话1234567890
''';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ios_share_rounded), onPressed: () {}),
        ],
      ),

      //body
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              HelpDetailTitle(),
              Divider(
                  color:
                      Theme.of(context).colorScheme.outline.withOpacity(0.3)),

              // Owner
              HelpDetailOwner(),
              Divider(
                  color:
                      Theme.of(context).colorScheme.outline.withOpacity(0.3)),

              // IdCard
              Text(
                '宠物信息',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PetIdCard(
                    name: data['name']!,
                    petAvatarUrl: data['petAvatarUrl'],
                    gender: data['gender']!,
                    petType: data['petType']!,
                    breed: data['breed']!,
                    birthDate: data['birthDate']!,
                    address: data['address']!,
                    petId: data['petId']!,
                    isQr: data['isQr']!,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                '互助详情',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(helpDetails,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        height: 1.5)),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.picture_in_picture_rounded,
          size: 17.0,
        ),
        label: Text(
          '立即沟通',
          style: TextStyle(fontSize: 16, letterSpacing: 2),
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



// home - pet_id_card.dart
import 'package:flutter/material.dart';

// PetIdCard 组件用于展示宠物的 ID 卡片信息
class PetIdCard extends StatelessWidget {
  final String name;
  final String petAvatarUrl;
  final int gender;
  final int petType;
  final String breed;
  final String birthDate;
  final String address;
  final String petId;
  final bool isQr;

  // 构造函数要求传入宠物信息的所有必要参数
  const PetIdCard({
    super.key,
    required this.name,
    required this.petAvatarUrl,
    required this.gender,
    required this.petType,
    required this.breed,
    required this.birthDate,
    required this.address,
    required this.petId,
    required this.isQr,
  });

  @override
  Widget build(BuildContext context) {
    // 设置文本样式
    TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: petType == 0
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.secondary,
      fontSize: 15,
      letterSpacing: 1,
      height: 1.5,
    );
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground,
      fontSize: 16,
      height: 1.5,
    );
    TextStyle idStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground,
      fontSize: 17,
      height: 1.5,
      letterSpacing: 2,
    );
    TextStyle qrStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: petType == 0
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.secondary,
      fontSize: 13,
      letterSpacing: 1,
    );
    Color iconColor = gender == 1 ? Colors.blue : Colors.pink;

    return Container(
      //width: 420,
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 24), // 内边距
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: petType == 0
            ? Theme.of(context).colorScheme.tertiaryContainer
            : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15), // 卡片圆角设置
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // 阴影位置
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 列内容尽可能占用最小空间
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 8.0, // 控制阴影的高度
                shape: CircleBorder(), // 指定形状为圆形
                child: CircleAvatar(
                  backgroundImage: NetworkImage(petAvatarUrl),
                  radius: 50,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('姓名', style: titleStyle),
                      SizedBox(width: 7),
                      Text(name, style: textStyle),
                      SizedBox(width: 6),
                      Icon(
                        gender == 1 ? Icons.male_rounded : Icons.female_rounded,
                        color: iconColor,
                        size: 22,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('品种', style: titleStyle),
                      SizedBox(width: 7),
                      Text(breed, style: textStyle),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('出生', style: titleStyle),
                      SizedBox(width: 7),
                      Text(birthDate, style: textStyle),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('地址', style: titleStyle),
                      SizedBox(width: 7),
                      Text(address, style: textStyle),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 24),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('宠物ID', style: titleStyle),
              SizedBox(width: 10),
              Text(petId, style: idStyle),
            ],
          ),
          Visibility(
            visible: isQr,
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  '生成二维码',
                  style: qrStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CommunityCard extends StatefulWidget {
  final String pictureUrl;
  final String title;
  final String content;
  final String userAvatarUrl;
  final String userName;
  final int isTest;
  final int likeNum;
  final int commentNum;
  final String tag;

  const CommunityCard({
    required this.pictureUrl,
    required this.title,
    required this.content,
    required this.userAvatarUrl,
    required this.userName,
    required this.isTest,
    required this.likeNum,
    required this.commentNum,
    required this.tag,
  });

  @override
  State<CommunityCard> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard> {
  late int _likeNum; // Make it a state variable
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _likeNum = widget.likeNum;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        _likeNum--;
      } else {
        _likeNum++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
            spreadRadius: 1, // 阴影的大小
            blurRadius: 1, // 阴影模糊度的大小，值越大阴影范围也越大，但也更透明
            offset: Offset(2, 2), // 阴影分别在水平和垂直方向上的偏移量
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // Make contents stretch in the cross axis
        children: [
          // 图片部分
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              widget.pictureUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 标题部分
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 4),
                // 正文内容部分
                Text(
                  widget.content,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6)),
                  maxLines: 2, // 最多显示两行
                  overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                ),
                SizedBox(height: 6),
                // 用户名和用户头像
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.userAvatarUrl),
                      radius: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.userName,
                      style: TextStyle(fontSize: 16),
                    ),
                    // 是否完成考试的tag
                    Visibility(
                      visible: widget.isTest == 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '已通过考试',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // tag和点赞、评论
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //tag
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer, // 边框颜色
                          width: 2, // 边框宽度
                        ),
                        borderRadius: BorderRadius.circular(20), // 边框圆角
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.sell_outlined,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: 16),
                          SizedBox(width: 5),
                          Text(widget.tag,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 15,
                              )),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    // 点赞数和评论数
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked
                                ? Icons.thumb_up_rounded
                                : Icons.thumb_up_outlined,
                            color: isLiked ? Colors.red : null,
                            size: 20,
                          ),
                          onPressed: toggleLike,
                        ),
                        Text("$_likeNum"),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Icons.chat_outlined, size: 20),
                          onPressed: () {},
                        ),
                        Text("${widget.commentNum}"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

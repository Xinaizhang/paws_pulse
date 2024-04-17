// community_detail - index.dart
import 'package:flutter/material.dart';

class CommunityDetailPage extends StatefulWidget {
  @override
  State<CommunityDetailPage> createState() => _CommunityDetailPageState();
}

class _CommunityDetailPageState extends State<CommunityDetailPage> {
  final Map<String, dynamic> mockData = {
    'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
    'pictureUrls': [
      'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'http://gallery.pawspulse.top/pawspulse/orange.png',
      'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'http://gallery.pawspulse.top/pawspulse/orange.png',
    ],
    'title': '寻找爱心家庭：可爱的拉布拉多寻找新家',
    'content': '''
    大家好，我是一个志愿者，我们这里有一只3岁的拉布拉多犬“摩卡”需要寻找一个温暖的家。摩卡非常友好，适合所有年龄段的家庭，对小孩特别有耐心。 
- 性别： 男
- 年龄： 3岁
- 接种疫苗情况： 已全面接种
- 健康状况： 非常健康，已做过绝育手术

    我们希望能找到一个爱宠物、有责任心的家庭，能给予摩卡足够的关爱和照顾。如果你有兴趣，欢迎留言或私信我，我们会提供更多信息。

联系方式：15712342611''',
    'likeNum': 20,
    'commentNum': 5,
    'tag': '领养',
    'publishTime': '2024-4-15 12:11',
    'userName': 'Jun',
    'address': '上海市浦东新区',
    'isTest': 1,
  };

  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool isLiked = false;
  int likeNum = 20; // 初始点赞数
  int commentNum = 5; // 初始评论数

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeNum += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: UserInfo(userData: mockData),
        titleSpacing: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ios_share_rounded), onPressed: () {}),
        ],
      ),

      //body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图片
            Container(
              height: 500,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: mockData['pictureUrls'].map<Widget>((url) {
                  return ClipRRect(
                    child: Image.network(
                      url,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  );
                }).toList(),
              ),
            ),
            // 页面指示器
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                mockData['pictureUrls'].length,
                (int index) => Container(
                  width: 14.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    mockData['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),

                  // content
                  Text(
                    mockData['content'],
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 15),

                  // tag和发布时间
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // tag
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
                            Text(mockData['tag'],
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15,
                                )),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      // 发布时间
                      Text(
                        mockData['publishTime'],
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.7)),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.3)),
                  SizedBox(height: 5),
                  Text('共 ${mockData['commentNum']} 条评论'),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar
      bottomNavigationBar: BottomAppBar(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '让大家听见你的声音...',
                  hintStyle: TextStyle(fontSize: 13),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(width: 12),
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite_rounded : Icons.favorite_outline,
                color: isLiked ? Colors.red : null,
                size: 20,
              ),
              onPressed: toggleLike,
            ),
            Text('$likeNum'),
            SizedBox(width: 6),
            IconButton(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 20,
              ),
              onPressed: () {},
            ),
            Text('$commentNum'),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserInfo({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userData['userAvatarUrl']),
            radius: 20.0,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jun',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded,
                        size: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7)),
                    SizedBox(width: 2),
                    Text(
                      userData['address'],
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7)),
                    ),
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

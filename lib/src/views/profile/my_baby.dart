// my_baby.dart
import 'package:flutter/material.dart';

class MyBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的baby',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width, // 设置最小宽度为屏幕宽度
                ),
                child: Row(
                  children: [
                    Container(
                      height: 190,
                      width: 130,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 18),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(90),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://gallery.pawspulse.top/pawspulse/blue.png'),
                        radius: 30.0,
                      ),
                    ),
                    Container(
                      height: 190,
                      width: 130,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 18),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(90),
                          bottomRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://gallery.pawspulse.top/pawspulse/blue.png'),
                        radius: 30.0,
                      ),
                    ),
                    Container(
                      height: 190,
                      width: 130,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 18),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(90),
                          bottomRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://gallery.pawspulse.top/pawspulse/blue.png'),
                        radius: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

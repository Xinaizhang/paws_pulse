import 'package:flutter/material.dart';

// Notification Data Model
class Notification {
  final String title;
  final String content;
  final String createdAt;

  Notification({
    required this.title,
    required this.content,
    required this.createdAt,
  });
}

// Notification Widget
class NotificationWidget extends StatelessWidget {
  final Notification notification;

  const NotificationWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notification Title
          Text(
            notification.title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          // Notification Content
          Text(
            notification.content,
            style: TextStyle(fontSize: 16.0),
          ),
          // Notification Creation Time
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    notification.createdAt,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Notifications List
class NotificationsList extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(
      title: '小灰灰真可爱',
      content: '小灰灰真可爱',
      createdAt: '2024-05-01',
    ),
    Notification(
      title: '小灰灰真可爱',
      content: '小灰灰真可爱',
      createdAt: '2024-05-02',
    ),
    Notification(
      title: '小灰灰真可爱',
      content: '小灰灰真可爱',
      createdAt: '2024-05-03',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NotificationWidget(notification: notifications[index]),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

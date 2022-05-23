import 'package:badges/badges.dart';
import 'package:e_commerce_app/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationButton extends StatefulWidget {
  NotificationButton({Key? key}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider = Provider.of(context);

    return Badge(
      position: BadgePosition(
        bottom: 30,
        top: 3,
      ),
      badgeColor: Colors.white,
      badgeContent: Center(
        child: Text(
          notificationProvider.notificationListLength.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      child: IconButton(onPressed: null, icon: Icon(Icons.notifications_none)),
    );
  }
}

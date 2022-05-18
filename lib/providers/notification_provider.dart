import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get notificationListLength {
    return notificationList.length;
  }
}

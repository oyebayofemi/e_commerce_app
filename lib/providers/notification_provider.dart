import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get notificationListLength {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }

  void clearCheckoutList() {
    notificationList.clear();
    notifyListeners();
  }

  void deleteCheckoutProduct(int index) {
    notificationList.removeAt(index);
    notifyListeners();
  }
}

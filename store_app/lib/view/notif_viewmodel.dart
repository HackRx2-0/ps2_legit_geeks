import 'dart:async';

import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/notification.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  NotificationList notificationList = NotificationList();
  List<Notification> notifications = [];

  bool categoriesFetched = false;
  bool notificationsFetched = false;

  void fetchInitData() async {
    if (notifications.isEmpty)
      fetchNotifications().whenComplete(() {
        notificationsFetched = false;
        setState();
      });
  }

  Future<List<Notification>> fetchNotifications() async {
    if (notifications.isEmpty) {
      // setState(ViewState.Busy);
      // notificationsFetched = true;
      // final notificationResponse = await _apiService.getCategories();
      // notifications = [];
      // if (!notificationResponse.error) {
      //   for (var x in notificationResponse.data) {
      //     Notification notification = Notification.fromMap(x);
      //     notifications.add(notification);
      //   }
      //   notificationList.notifications = notifications;
    } else {
      // print(notificationResponse.errorMessage);
    }
  }
  // return notifications;
}

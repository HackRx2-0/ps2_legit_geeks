import 'package:flutter/material.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import '../../config/timeAgo.dart';
import '../models/notification.dart' as model;
import '../widgets/EmptyNotificationsWidget.dart';
import '../widgets/NotificationItemWidget.dart';
import '../widgets/SearchBarWidget.dart';

class NotificationsWidget extends StatefulWidget {
  final Future<void> Function(int, String, String) showNotification;
  NotificationsWidget(this.showNotification);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  model.NotificationList _notificationList;
  WebSocketChannel _channel;
  bool voice;
  String selectedLang;

  @override
  void initState() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('ws://f8c690dab876.ngrok.io/ws/notifications/'),
      );
    } catch (e) {
      print(e);
    }
    Prefs().getLanguage().then((value) => selectedLang = value);
    Prefs().getVoiceNotification().then((value) => voice = value);
    this._notificationList = new model.NotificationList();
    super.initState();
  }

  DateTime formatTime(String time) {
    var _date = time.split(" ");
    int year = int.parse(_date[2]);
    int month = 6; // change
    int day = int.parse(_date[1]);

    var _time = _date[3].split(":");
    int hour = int.parse(_time[0]);
    int min = int.parse(_time[1]);
    int sec = int.parse(_time[2]);

    DateTime _notifTime = DateTime(
      year,
      month,
      day,
      hour,
      min,
      sec,
    );

    return _notifTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),
            Offstage(
              offstage: _notificationList.notifications.isEmpty,
              child: StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final response = jsonDecode(snapshot.data);
                    // print(item);

                    for (var item in response) {
                      var notification = model.Notification.fromMap(item);
                      var contain = _notificationList.notifications
                          .where((element) => element.id == notification.id);
                      if (contain.isNotEmpty)
                        continue;
                      else {
                        _notificationList.notifications.add(notification);
                        print(selectedLang);
                        if (selectedLang == 'English') {
                          widget.showNotification(
                            notification.id,
                            notification.title,
                            notification.description,
                          );
                        } else if (selectedLang == 'Hindi') {
                          widget.showNotification(
                            notification.id,
                            notification.title_hi,
                            notification.description_hi,
                          );
                        }
                      }
                    }
                    // _notificationList.notifications.contains()
                    print(_notificationList);
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _notificationList.notifications.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7);
                      },
                      itemBuilder: (context, index) {
                        final notification =
                            _notificationList.notifications[index];

                        print(notification);
                        if (selectedLang == 'English') {
                          return NotificationItemWidget(
                            notification: model.Notification(
                              image: notification.image,
                              title: notification.title,
                              time: TimeAgo.timeAgoSinceDate(
                                  formatTime(notification.time)),
                              read: false,
                              description: notification.description,
                            ),
                            onDismissed: (notification) {
                              setState(() {
                                _notificationList.notifications.removeAt(index);
                              });
                            },
                          );
                        } else {
                          return NotificationItemWidget(
                            notification: model.Notification(
                              image: notification.image,
                              title: notification.title_hi,
                              time: TimeAgo.timeAgoSinceDate(
                                  formatTime(notification.time)),
                              read: false,
                              description: notification.description_hi,
                            ),
                            onDismissed: (notification) {
                              setState(() {
                                _notificationList.notifications.removeAt(index);
                              });
                            },
                          );
                        }
                      },
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Offstage(
              offstage: _notificationList.notifications.isNotEmpty,
              child: EmptyNotificationsWidget(),
            )
          ],
        ),
      ),
    );
  }
}

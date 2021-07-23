import 'package:store_app/config/timeAgo.dart';

class LastMessage {
  String text;
  String timestamp;

  LastMessage({this.text, this.timestamp});

  LastMessage.fromJson(Map<String, dynamic> json) {
    text = json['message_text'];
    timestamp = TimeAgo.timeAgoSinceDate(formatTime(json['created_on']));
  }

  DateTime formatTime(String time) {
    var _date = time.split(" ");
    int year = int.parse(_date[2]);
    int month = 7; // change
    int day = int.parse(_date[0]);

    var _time = _date[3].split(":");
    int hour = int.parse(_time[0]);
    int min = int.parse(_time[1]);
    int sec = int.parse(_time[2]);

    DateTime _formatTime = DateTime(
      year,
      month,
      day,
      hour,
      min,
      sec,
    );
    return _formatTime;
  }
}

import 'package:intl/intl.dart';

class TimeAgo {
  static String timeAgoSinceDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 8)
      return DateFormat.MMMd().format(dateTime);
    else if ((difference.inDays / 7).floor() >= 1)
      return "Last Week";
    else if (difference.inDays >= 2)
      return "${difference.inDays} Ago";
    else if (difference.inDays >= 1)
      return "Yesterday";
    else if (difference.inHours >= 2)
      return "${difference.inHours} Hours Ago";
    else if (difference.inHours >= 1)
      return "An Hour Ago";
    else if (difference.inMinutes >= 2)
      return "${difference.inMinutes} Minutes Ago";
    else if (difference.inMinutes >= 1)
      return "A Hour Ago";
    else
      return "Just Now";
  }
}

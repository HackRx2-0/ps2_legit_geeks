class Notification {
  int id;
  String image;
  String title;
  String time;
  String title_hi;
  String description;
  String description_hi;
  bool read;

  Notification({
    this.id,
    this.image,
    this.title,
    this.time,
    this.read,
    this.title_hi,
    this.description,
    this.description_hi,
  });

  factory Notification.fromMap(Map<String, dynamic> map) => Notification(
        id: map['id'],
        image: map['image'],
        title: map['title'],
        time: map['datetime'],
        title_hi: map['title_hi'],
        description: map['description'],
        description_hi: map['description_hi'],
        read: false,
      );
}

class NotificationList {
  List<Notification> _notifications;

  NotificationList() {
    this._notifications = [];
  }

  List<Notification> get notifications => _notifications;
  set notifications(x) => _notifications = x;
}

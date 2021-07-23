import 'package:store_app/src/models/lastMessage.dart';

class GroupConversation {
  int id;
  String name;
  String title;
  String image;
  LastMessage lastMessage;
  int unseenMessages;

  GroupConversation(
      {this.id, this.name, this.title, this.image, this.lastMessage});

  GroupConversation.fromJson(Map<String, dynamic> m) {
    id = m['id'];
    name = m['name'];
    title = m['title'];
    image = m['image'];
    lastMessage = LastMessage.fromJson(m['last_message'][0]);
    unseenMessages = m['unseen_messages'] as int;
  }
}

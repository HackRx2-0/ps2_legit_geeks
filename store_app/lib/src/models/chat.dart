import './user.dart';
import 'package:flutter/material.dart';

class Chat {
  String id = UniqueKey().toString();
  User _currentUser = new User.init().getCurrentUser();
  String text;
  String time;
  User user;

  Chat({this.text, this.time, this.user});
  Chat.fromJson(Map<String, dynamic> json) {
    this.id = json['id'].toString();
    this.text = json['message_text'];
    this.user = json['user'] == 1
        ? _currentUser
        : User.basic(
            firstName: 'Raghav',
            lastName: 'Shukla',
            avatar: 'img/user0.jpg',
            userState: UserState.available);
  }
}

//class ChatList{
//  List<Chat> _list;
//
//  ChatList(){
//    _list = [
//      new Chat('Ok', '32 ago')
//      new Chat('Ok', '32 ago')
//    ];
//  }
//}

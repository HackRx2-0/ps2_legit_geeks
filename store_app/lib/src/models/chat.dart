import 'package:store_app/src/models/product.dart';

import './user.dart';
import 'package:flutter/material.dart';

class Chat {
  String id = UniqueKey().toString();
  String text;
  String time;
  User user;
  int room;
  Product product;
  String type;

  Chat(
      {this.id,
      this.type,
      // this.fileField,
      this.text,
      this.product,
      this.user,
      this.time,
      this.room});
  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    type = json['type'];
    // fileField = json['file_field'];
    text = json['message_text'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    user = User.basic(
        firstName: json['user']['first_name'],
        lastName: json['user']['last_name'],
        avatar: json['user']['profile_pic'],
        id: json['user']['id'].toString());
    time = json['created_on'];
    room = json['room'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['type'] = this.type;
  //   // data['file_field'] = this.fileField;
  //   data['message_text'] = this.text;
  //   data['user'] = this.user;
  //   data['created_on'] = this.time;
  //   data['room'] = this.room;
  //   return data;
  // }
}

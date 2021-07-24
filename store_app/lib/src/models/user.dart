import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart' show DateFormat;

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String firstName;
  String lastName;
  String email;
  String avatar;
  String address;
  UserState userState;
  String phoneNumber;

  User.init();

  User.basic(
      {this.firstName, this.lastName, this.avatar, this.userState, this.id});

  User.advanced(
      {this.firstName,
      this.lastName,
      this.email,
      this.avatar,
      this.address,
      this.userState,
      this.phoneNumber});

  User getCurrentUser() {
    return User.advanced(
        firstName: 'Rahul',
        lastName: 'Dev',
        email: 'rahuldev30@gmail.com',
        avatar: 'img/temp/Rahul.jpeg',
        address: 'B1 34, sector 69 Dwarka, Delhi',
        userState: UserState.available,
        phoneNumber: '9080789067');
  }
}

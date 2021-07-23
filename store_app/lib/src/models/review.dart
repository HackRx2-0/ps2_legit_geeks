import 'dart:math';

import './user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class Review {
  String id = UniqueKey().toString();
  User user;
  String review;
  double rate;
  DateTime dateTime =
      DateTime.now().subtract(Duration(days: Random().nextInt(20)));

  Review({this.user, this.review, this.rate});

  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }
}

class ReviewsList {
  List<Review> _reviewsList;

  List<Review> get reviewsList => _reviewsList;

  ReviewsList() {
    this._reviewsList = [
      new Review(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          review:
              'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
          rate: 3.2),
      new Review(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user1.jpg',
              userState: UserState.available),
          review:
              'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
          rate: 3.2),
      new Review(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user2.jpg',
              userState: UserState.available),
          review:
              'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
          rate: 3.2),
      new Review(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user3.jpg',
              userState: UserState.available),
          review:
              'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
          rate: 3.2),
      new Review(
          user: new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user1.jpg',
              userState: UserState.available),
          review:
              'There are a few foods that predate colonization, and the European colonization of the Americas brought',
          rate: 3.2)
    ];
  }
}

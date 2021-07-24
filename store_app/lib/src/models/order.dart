import 'dart:math';

import './product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

enum OrderState { unpaid, toBeShipped, shipped, inDispute }

class Track {
  String id = UniqueKey().toString();
  String description;
  String currentLocation;
  DateTime dateTime;

  Track({this.description, this.currentLocation, this.dateTime});

  static List<Track> getTrackingList() {
    return [
      new Track(
          description: 'Your Order in local post',
          currentLocation: 'United State',
          dateTime: DateTime.now().subtract(Duration(days: 1))),
      new Track(
          description: 'Your Order arrived in destination',
          currentLocation: 'United State',
          dateTime: DateTime.now().subtract(Duration(days: 5))),
      new Track(
          description: 'Order in aeroport',
          currentLocation: 'France',
          dateTime: DateTime.now().subtract(Duration(days: 8))),
      new Track(
          description: 'Your order oversea in china',
          currentLocation: 'China',
          dateTime: DateTime.now().subtract(Duration(days: 10))),
    ];
  }
}

class Order {
  String id = UniqueKey().toString();
  Product product;
  int quantity = Random().nextInt(10);
  String trackingNumber;
  DateTime dateTime =
      DateTime.now().subtract(Duration(days: Random().nextInt(20)));
  OrderState orderState;
  List<Track> tracking = Track.getTrackingList();

  Order(this.product, this.trackingNumber, this.orderState);

  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }
}

class OrderList {
  List<Order> _list;

  List<Order> get list => _list;

  OrderList() {
    this._list = [
      new Order(
          new Product(
              name: 'Digital Display Bracelet Watch',
              image: 'img/watch6.webp',
              available: 80,
              price: 63.98,
              quantity: 200,
              sales: 2554,
              rate: 3.1,
              discount: 10.5),
          'RB4551532214564',
          OrderState.shipped),
      new Order(
          new Product(
              name: 'Spring Hand Grip Finger Strength',
              image: 'img/sport5.webp',
              available: 10,
              price: 12.36,
              quantity: 153,
              sales: 166,
              rate: 4.2,
              discount: 11.5),
          'CH4561454563156',
          OrderState.toBeShipped),
      new Order(
          new Product(
              name: 'Digital Display Bracelet Watch',
              image: 'img/home10.webp',
              available: 80,
              price: 63.98,
              quantity: 200,
              sales: 2554,
              rate: 3.1,
              discount: 10.5),
          'RB4551532214564',
          OrderState.unpaid),
      new Order(
          new Product(
              name: 'Robe pin up',
              image: 'img/home2.webp',
              available: 10,
              price: 12.36,
              quantity: 153,
              sales: 166,
              rate: 4.2,
              discount: 11.5),
          'CH456124566652',
          OrderState.shipped),
    ];
  }
}

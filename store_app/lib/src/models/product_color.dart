import 'package:flutter/material.dart';

class ProductColor {
  String id = UniqueKey().toString();
  Color color;
  String name;
  bool selected;

  ProductColor({this.color, this.name, this.selected});
}

class ProductColorsList {
  List<ProductColor> _list;

  List<ProductColor> get list => _list;

  ProductColorsList() {
    ;
    _list = [
      new ProductColor(color: Colors.blueAccent, name: 'Blue', selected: true),
      new ProductColor(
          color: Colors.greenAccent, name: 'Green', selected: true),
      new ProductColor(
          color: Colors.blueGrey, name: 'Blue Grey', selected: false),
      new ProductColor(color: Colors.cyanAccent, name: 'Cyan', selected: true),
      new ProductColor(
          color: Colors.deepPurpleAccent, name: 'Purple', selected: false),
    ];
  }

  void clearSelection() {
    _list.forEach((color) {
      color.selected = false;
    });
  }
}

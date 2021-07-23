import 'package:flutter/material.dart';

class ProductSize {
  String id = UniqueKey().toString();
  String code;
  String name;
  bool selected;

  ProductSize({this.code, this.name, this.selected});
}

class ProductSizesList {
  List<ProductSize> _list;

  List<ProductSize> get list => _list;

  ProductSizesList() {
    _list = [
      new ProductSize(code: 'XS', name: 'Extra Small', selected: true),
      new ProductSize(code: 'S', name: 'Small', selected: true),
      new ProductSize(code: 'M', name: 'Medium', selected: false),
      new ProductSize(code: 'L', name: 'Large', selected: true),
      new ProductSize(code: 'XL', name: 'Extra Large', selected: false),
      new ProductSize(code: 'XXL', name: '2 Extra Large', selected: false),
    ];
  }
  void clearSelection() {
    _list.forEach((size) {
      size.selected = false;
    });
  }
}

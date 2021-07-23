import 'package:store_app/src/models/product.dart';

class WishlistModel {
  int id;
  Product product;
  String createdAt;

  WishlistModel({this.id, this.product, this.createdAt});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   if (this.product != null) {
  //     data['product'] = this.product.toJson();
  //   }
  //   data['created_at'] = this.createdAt;
  //   return data;
  // }
}

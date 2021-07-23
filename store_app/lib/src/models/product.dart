import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/constant/assetImages.dart';
import 'dart:math';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String id = UniqueKey().toString();
  int productId;
  String name;
  String image;
  double averageRating;
  int minQty;
  int minWholesalePrice;
  //String description;
  double price;
  int available;
  int quantity;
  int sales;
  double rate;
  double discount;

  Product(
      {this.name,
      this.image,
      this.averageRating,
      this.minQty,
      this.minWholesalePrice,
      this.available,
      this.price,
      this.quantity,
      this.sales,
      this.rate,
      this.discount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    averageRating = json['average_rating'];
    image =
        json['image']['url'] != null ? json['image']['url'] : Images.noImage;
    minQty = json['min_qty'];
    minWholesalePrice = json['min_price'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['average_rating'] = this.averageRating;
  //   if (this.image != null) {
  //     data['image'] = this.image.toJson();
  //   }
  //   data['min_qty'] = this.minQty;
  //   data['min_wholesale_price'] = this.minWholesalePrice;
  //   return data;
  // }

  String getPrice({double myPrice}) {
    if (myPrice != null) {
      return '\₹${myPrice.toStringAsFixed(2)}';
    }
    Random rnd = new Random();
    int min = 1;
    int max = 100;
    var random = min + rnd.nextInt(max - min);
    return '\₹${random.toStringAsFixed(2)}';
  }
}

class ProductsList {
  List<Product> _flashSalesList;
  List<Product> _list;
  List<Product> _categorized;
  List<Product> _favoritesList;
  List<Product> _cartList;

  set categorized(List<Product> value) {
    _categorized = value;
  }

  List<Product> get categorized => _categorized;

  List<Product> get list => _list;
  List<Product> get flashSalesList => _flashSalesList;
  List<Product> get favoritesList => _favoritesList;
  List<Product> get cartList => _cartList;

  ProductsList() {
    _flashSalesList = [
      new Product(
          name: 'Maxi Dress For Women Summer',
          image: 'img/pro1.webp',
          available: 25,
          price: 36.12,
          quantity: 200,
          sales: 130,
          rate: 4.3,
          discount: 12.1),
      new Product(
          name: 'Black Checked Retro Hepburn Style',
          image: 'img/pro2.webp',
          available: 60,
          price: 12.65,
          quantity: 200,
          sales: 63,
          rate: 5.0,
          discount: 20.2),
      new Product(
          name: 'Robe pin up Vintage Dress Autumn',
          image: 'img/pro3.webp',
          available: 10,
          price: 66.96,
          quantity: 200,
          sales: 415,
          rate: 4.9,
          discount: 15.3),
      new Product(
          name: 'Elegant Casual Dress',
          image: 'img/pro4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
    ];

    _list = [
      new Product(
          name: 'Summer Fashion Women Dress',
          image: 'img/pro5.webp',
          available: 25,
          price: 36.12,
          quantity: 200,
          sales: 130,
          rate: 4.3,
          discount: 12.1),
      new Product(
          name: 'Women Half Sleeve',
          image: 'img/pro6.webp',
          available: 60,
          price: 12.65,
          quantity: 200,
          sales: 63,
          rate: 5.0,
          discount: 20.2),
      new Product(
          name: 'Elegant Plaid Dresses Women Fashion',
          image: 'img/pro7.webp',
          available: 10,
          price: 66.96,
          quantity: 200,
          sales: 415,
          rate: 4.9,
          discount: 15.3),
      new Product(
          name: 'Maxi Dress For Women Summer',
          image: 'img/pro1.webp',
          available: 25,
          price: 36.12,
          quantity: 200,
          sales: 130,
          rate: 4.3,
          discount: 12.1),
      new Product(
          name: 'Black Checked Retro Hepburn Style',
          image: 'img/pro2.webp',
          available: 60,
          price: 12.65,
          quantity: 200,
          sales: 63,
          rate: 5.0,
          discount: 20.2),
      new Product(
          name: 'Robe pin up Vintage Dress Autumn',
          image: 'img/pro3.webp',
          available: 10,
          price: 66.96,
          quantity: 200,
          sales: 415,
          rate: 4.9,
          discount: 15.3),
      new Product(
          name: 'Elegant Casual Dress',
          image: 'img/pro4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Zogaa FlameSweater',
          image: 'img/man1.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men Polo Shirt Brand Clothing',
          image: 'img/man2.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Polo Shirt for Men',
          image: 'img/man3.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men\'s Sport Pants Long Summer',
          image: 'img/man4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men\'s Hoodies Pullovers Striped',
          image: 'img/man5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men Double Breasted Suit Vests',
          image: 'img/man6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Puimentiua Summer Fashion',
          image: 'img/man7.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Casual Sweater fashion Jacket',
          image: 'img/man8.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Fashion Baby Sequins Party Dance Ballet',
          image: 'img/baby1.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Children Martin Boots PU Leather',
          image: 'img/baby2.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Baby Boys Denim Jacket',
          image: 'img/baby3.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Mom and Daughter Matching Women',
          image: 'img/baby4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Unicorn Pajamas Winter Flannel Family',
          image: 'img/baby5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Party Decorations Kids',
          image: 'img/baby6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Cooking Tools Set Premium',
          image: 'img/home1.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Reusable Metal Drinking Straws',
          image: 'img/home2.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Absorbent Towel Face',
          image: 'img/home3.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Pair Heat Resistant Thick Silicone',
          image: 'img/home4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Electric Mosquito Killer Lamp',
          image: 'img/home5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Terrarium Hydroponic Plant Vases',
          image: 'img/home6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Steel Cutlery Set Gold Cutlery',
          image: 'img/home7.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Silicone Kitchen Organizer Insulated ',
          image: 'img/home8.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Non Stick Wooden Handle Silicone ',
          image: 'img/home9.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Foldable Silicone Colander Fruit Vegetable',
          image: 'img/home10.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Adjustable Sprinkler Plastic Water Sprayer ',
          image: 'img/home11.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Back Shoulder Posture Correction',
          image: 'img/sport1.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Ankle Support Brace Elasticity',
          image: 'img/sport2.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men Women Swimming Goggles',
          image: 'img/sport3.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Yosoo Knee pad Elastic',
          image: 'img/sport4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Spring Hand Grip Finger Strength',
          image: 'img/sport5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Knee Sleeves',
          image: 'img/sport6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Brothock Professional basketball socks',
          image: 'img/sport7.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'New men s running trousers',
          image: 'img/sport8.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Cotton Elastic Hand Arthritis',
          image: 'img/sport9.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Spring Half Finger Outdoor Sports',
          image: 'img/sport10.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men Wrist Watch Stainless',
          image: 'img/watch1.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Reef Tiger RT Mens Sport Watches',
          image: 'img/watch2.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Sport watch Waterproof',
          image: 'imgrate:/watcdiscount:h3.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Sport Watch Black Military',
          image: 'img/watch4.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Digital Waterproof Wrist Watch',
          image: 'img/watch5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Digital Display Bracelet Watch',
          image: 'img/watch6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Men Sports Watch Silicone Watchband',
          image: 'img/watch7.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Fashion Waterproof Men Digital Watches',
          image: 'img/watch8.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Alarm Waterproof Sports Army',
          image: 'img/watch9.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
    ];

    _favoritesList = [
      new Product(
          name: 'Plant Vases',
          image: 'img/home6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Maxi Dress For Women Summer',
          image: 'img/pro1.webp',
          available: 25,
          price: 36.12,
          quantity: 200,
          sales: 130,
          rate: 4.3,
          discount: 12.1),
      new Product(
          name: 'Foldable Silicone Colander Fruit Vegetable',
          image: 'img/home10.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Robe pin up',
          image: 'img/pro3.webp',
          available: 10,
          price: 66.96,
          quantity: 200,
          sales: 415,
          rate: 4.9,
          discount: 15.3),
      new Product(
          name: 'Wrist Watch',
          image: 'img/watch5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Alarm Waterproof Sports Army',
          image: 'img/watch9.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Black Checked Retro Hepburn Style',
          image: 'img/pro2.webp',
          available: 60,
          price: 12.65,
          quantity: 200,
          sales: 63,
          rate: 5.0,
          discount: 20.2),
    ];

    _cartList = [
      new Product(
          name: 'Plant Vases',
          image: 'img/home6.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Maxi Dress For Women Summer',
          image: 'img/pro1.webp',
          available: 25,
          price: 36.12,
          quantity: 200,
          sales: 130,
          rate: 4.3,
          discount: 12.1),
      new Product(
          name: 'Foldable Silicone Colander Fruit Vegetable',
          image: 'img/home10.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Robe pin up',
          image: 'img/pro3.webp',
          available: 10,
          price: 66.96,
          quantity: 200,
          sales: 415,
          rate: 4.9,
          discount: 15.3),
      new Product(
          name: 'Wrist Watch',
          image: 'img/watch5.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Alarm Waterproof Sports Army',
          image: 'img/watch9.webp',
          available: 80,
          price: 63.98,
          quantity: 200,
          sales: 2554,
          rate: 3.1,
          discount: 10.5),
      new Product(
          name: 'Black Checked Retro Hepburn Style',
          image: 'img/pro2.webp',
          available: 60,
          price: 12.65,
          quantity: 200,
          sales: 63,
          rate: 5.0,
          discount: 20.2),
    ];
  }
}

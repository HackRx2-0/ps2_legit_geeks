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
  double price;
  int available;
  int quantity;
  int sales;
  double rate;
  double discount;
  int productType;
  Category category;
  Variations variations;
  Brand brand;
  String description;
  String updatedAt;
  bool chargeTaxes;
  double productQty;
  bool visibleInListings;
  List<Variants> variants;
  List<Prices> prices;
  int views;

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
    image = json['image']['image'] != null ? json['image']['image'] : null;
    minQty = json['min_qty'];
    minWholesalePrice = json['min_price'];
  }
  Product.fromJsonDetail(Map<String, dynamic> json) {
    // averageRating = json['average_rating']!=null?json['average_rating'];
    // image = json['image']['image'] != null ? json['image']['image'] : null;
    // minQty = json['min_qty'];
    // minWholesalePrice = json['min_price'];
    id = json['id'].toString();
    productType = json['product_type'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    variations = json['variations'] != null
        ? new Variations.fromJson(json['variations'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    name = json['name'];
    description = json['description'];
    updatedAt = json['updated_at'];
    chargeTaxes = json['charge_taxes'];
    productQty = json['product_qty'];
    visibleInListings = json['visible_in_listings'];
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = new List<Prices>();
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
    views = json['views'];
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

  String getPrice({int myPrice}) {
    if (myPrice != null) {
      return '\₹$myPrice';
    }

    return '\₹$minWholesalePrice';
  }
}

class Category {
  int id;
  String name;
  String icon;

  Category({this.id, this.name, this.icon});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class Variations {
  Null name;

  Variations({this.name});

  Variations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Brand {
  int id;
  String color;
  String name;
  String image;
  String alt;

  Brand({this.id, this.color, this.name, this.image, this.alt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    name = json['name'];
    image = json['image'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['name'] = this.name;
    data['image'] = this.image;
    data['alt'] = this.alt;
    return data;
  }
}

class Variants {
  int id;
  String name;
  int product;
  Variant variant;
  List<Images> images;
  bool trackInventory;
  double productQty;
  double price;
  double discountedPrice;

  Variants(
      {this.id,
      this.name,
      this.product,
      this.variant,
      this.images,
      this.trackInventory,
      this.productQty,
      this.price,
      this.discountedPrice});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    product = json['product'];
    variant =
        json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    trackInventory = json['track_inventory'];
    productQty = json['product_qty'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product'] = this.product;
    if (this.variant != null) {
      data['variant'] = this.variant.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['track_inventory'] = this.trackInventory;
    data['product_qty'] = this.productQty;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
  }
}

class Variant {
  int id;
  String name;

  Variant({this.id, this.name});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  int id;
  String image;
  String alt;

  Images({this.id, this.image, this.alt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['alt'] = this.alt;
    return data;
  }
}

class Prices {
  int id;
  int product;
  int minQty;
  int price;
  int discountedPrice;

  Prices(
      {this.id, this.product, this.minQty, this.price, this.discountedPrice});

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    minQty = json['min_qty'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['min_qty'] = this.minQty;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
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

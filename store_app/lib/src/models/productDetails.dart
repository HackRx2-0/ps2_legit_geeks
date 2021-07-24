class ProductDetails {
  String id;
  int productType;
  Category category;
  Variations variations;
  Brand brand;
  String name;
  String description;
  String updatedAt;
  bool chargeTaxes;
  int productQty;
  bool visibleInListings;
  List<Variants> variants;
  List<Prices> prices;
  int views;

  ProductDetails(
      {this.id,
      this.productType,
      this.category,
      this.variations,
      this.brand,
      this.name,
      this.description,
      this.updatedAt,
      this.chargeTaxes,
      this.productQty,
      this.visibleInListings,
      this.variants,
      this.prices,
      this.views});

  ProductDetails.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.variations != null) {
      data['variations'] = this.variations.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['charge_taxes'] = this.chargeTaxes;
    data['product_qty'] = this.productQty;
    data['visible_in_listings'] = this.visibleInListings;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    data['views'] = this.views;
    return data;
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
  int productQty;
  int price;
  int discountedPrice;

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

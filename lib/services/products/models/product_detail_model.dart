import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));
String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  int id;
  String sku;
  String title;
  String slug;
  String description;
  String content;
  String thumbnailImage;
  String videoLink;
  int quantity;
  double price;
  int discount;
  dynamic promotional;
  int totalReviews;
  int averageReview;
  num? height;
  num? width;
  num? length;
  num? weight;
  bool isFragile;
  bool isOrganic;
  bool isListed;
  DateTime createdOn;
  DateTime updatedOn;
  Shop shop;
  Category category;
  List<Tag> tags;

  ProductDetailModel({
    required this.id,
    required this.sku,
    required this.title,
    required this.slug,
    required this.description,
    required this.content,
    required this.thumbnailImage,
    required this.videoLink,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
    required this.isFragile,
    required this.isOrganic,
    required this.isListed,
    required this.createdOn,
    required this.updatedOn,
    required this.shop,
    required this.category,
    required this.tags,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    id: json["id"],
    sku: json["sku"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    content: json["content"],
    thumbnailImage: json["thumbnail_image"],
    videoLink: json["video_link"],
    quantity: json["quantity"],
    price: json["price"],
    discount: json["discount"],
    promotional: json["promotional"],
    totalReviews: json["total_reviews"],
    averageReview: json["average_review"],
    height: json["height"],
    width: json["width"],
    length: json["length"],
    weight: json["weight"],
    isFragile: json["is_fragile"],
    isOrganic: json["is_organic"],
    isListed: json["is_listed"],
    createdOn: DateTime.parse(json["created_on"]),
    updatedOn: DateTime.parse(json["updated_on"]),
    shop: Shop.fromJson(json["shop"]),
    category: Category.fromJson(json["category"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "title": title,
    "slug": slug,
    "description": description,
    "content": content,
    "thumbnail_image": thumbnailImage,
    "video_link": videoLink,
    "quantity": quantity,
    "price": price,
    "discount": discount,
    "promotional": promotional,
    "total_reviews": totalReviews,
    "average_review": averageReview,
    "height": height,
    "width": width,
    "length": length,
    "weight": weight,
    "is_fragile": isFragile,
    "is_organic": isOrganic,
    "is_listed": isListed,
    "created_on": createdOn.toIso8601String(),
    "updated_on": updatedOn.toIso8601String(),
    "shop": shop.toJson(),
    "category": category.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  dynamic parent;
  String thumbnailImage;

  Category({
    required this.id,
    required this.name,
    required this.parent,
    required this.thumbnailImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    parent: json["parent"],
    thumbnailImage: json["thumbnail_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent": parent,
    "thumbnail_image": thumbnailImage,
  };
}

class Shop {
  int pk;
  User user;
  String shopName;

  Shop({
    required this.pk,
    required this.user,
    required this.shopName,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    pk: json["pk"],
    user: User.fromJson(json["user"]),
    shopName: json["shop_name"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "user": user.toJson(),
    "shop_name": shopName,
  };
}

class User {
  int id;
  String username;
  String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}

class Tag {
  int id;
  String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

import 'dart:convert';

class ProductDetailModel {
  int id;
  String sku;
  String title;
  String slug;
  String description;
  String content;
  String? thumbnailImage;
  String? videoLink;
  int quantity;
  double price;
  int discount;
  String? promotional;
  int totalReviews;
  int averageReview;
  double? height;
  double? width;
  double? length;
  double? weight;
  bool isFragile;
  bool isOrganic;
  bool isListed;
  DateTime createdOn;
  DateTime updatedOn;
  Vendor shop;
  ProductCategory category;
  List<ProductTag> tags;

  ProductDetailModel({
    required this.id,
    required this.sku,
    required this.title,
    required this.slug,
    required this.description,
    required this.content,
    this.thumbnailImage,
    this.videoLink,
    required this.quantity,
    required this.price,
    required this.discount,
    this.promotional,
    required this.totalReviews,
    required this.averageReview,
    this.height,
    this.width,
    this.length,
    this.weight,
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
        price: json["price"].toDouble(),
        discount: json["discount"],
        promotional: json["promotional"],
        totalReviews: json["total_reviews"],
        averageReview: json["average_review"],
        height: json["height"]?.toDouble(),
        width: json["width"]?.toDouble(),
        length: json["length"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        isFragile: json["is_fragile"],
        isOrganic: json["is_organic"],
        isListed: json["is_listed"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        shop: Vendor.fromJson(json["shop"]),
        category: ProductCategory.fromJson(json["category"]),
        tags: List<ProductTag>.from(
            json["tags"].map((x) => ProductTag.fromJson(x))),
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

class Vendor {
  int pk;
  User user;
  String? shopName;

  Vendor({
    required this.pk,
    required this.user,
    this.shopName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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

class ProductCategory {
  int id;
  String name;
  int? parent;
  String? thumbnailImage;

  ProductCategory({
    required this.id,
    required this.name,
    this.parent,
    this.thumbnailImage,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
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

class ProductTag {
  int id;
  String name;

  ProductTag({
    required this.id,
    required this.name,
  });

  factory ProductTag.fromJson(Map<String, dynamic> json) => ProductTag(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

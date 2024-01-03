import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int count;
  String? next;
  String? previous;
  List<Result> results;

  ProductModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String title;
  String slug;
  String thumbnailImage;
  int quantity;
  double price;
  int discount;
  String? promotional;
  int totalReviews;
  int averageReview;
  Shop shop;
  Category category;
  List<Tag> tags;

  Result({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnailImage,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
    required this.shop,
    required this.category,
    required this.tags,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    thumbnailImage: json["thumbnail_image"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble(),
    discount: json["discount"],
    promotional: json["promotional"],
    totalReviews: json["total_reviews"],
    averageReview: json["average_review"],
    shop: Shop.fromJson(json["shop"]),
    category: Category.fromJson(json["category"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "thumbnail_image": thumbnailImage,
    "quantity": quantity,
    "price": price,
    "discount": discount,
    "promotional": promotional,
    "total_reviews": totalReviews,
    "average_review": averageReview,
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
  ShopName shopName;

  Shop({
    required this.pk,
    required this.user,
    required this.shopName,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    pk: json["pk"],
    user: User.fromJson(json["user"]),
    shopName: shopNameValues.map[json["shop_name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "user": user.toJson(),
    "shop_name": shopNameValues.reverse[shopName],
  };
}

enum ShopName {
  EXARTH
}

final shopNameValues = EnumValues({
  "exarth": ShopName.EXARTH
});

class User {
  int id;
  Username username;
  Email email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: usernameValues.map[json["username"]]!,
    email: emailValues.map[json["email"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": usernameValues.reverse[username],
    "email": emailValues.reverse[email],
  };
}

enum Email {
  NBSHERAZKHAN_GMAIL_COM
}

final emailValues = EnumValues({
  "nbsherazkhan@gmail.com": Email.NBSHERAZKHAN_GMAIL_COM
});

enum Username {
  NBSHERAZKHAN
}

final usernameValues = EnumValues({
  "nbsherazkhan": Username.NBSHERAZKHAN
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

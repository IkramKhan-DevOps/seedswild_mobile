class ProductModel {
  int count;
  String? next;
  String? previous;
  List<Product> results;

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
    results: List<Product>.from(
      json["results"].map((x) => Product.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String title;
  String slug;
  String? thumbnailImage;
  int quantity;
  double price;
  int discount;
  String? promotional;
  int totalReviews;
  int averageReview;
  Shop shop;
  ProductCategory category;
  List<ProductTag> tags;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    thumbnailImage: json["thumbnail_image"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble() ?? 0.0,
    discount: json["discount"],
    promotional: json["promotional"],
    totalReviews: json["total_reviews"],
    averageReview: json["average_review"],
    shop: Shop.fromJson(json["shop"]),
    category: ProductCategory.fromJson(json["category"]),
    tags: List<ProductTag>.from(
      json["tags"].map((x) => ProductTag.fromJson(x)),
    ),
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

class Shop {
  int pk;
  User user;
  String? shopName;

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

class ProductCategory {
  int id;
  String name;
  int? parent;
  String? thumbnailImage;

  ProductCategory({
    required this.id,
    required this.name,
    required this.parent,
    required this.thumbnailImage,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
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

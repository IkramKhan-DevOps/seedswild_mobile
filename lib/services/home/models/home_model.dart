// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<AllProduct> allProducts;
  List<AllProduct> newProducts;
  List<AllProduct> mostSales;
  List<Category> categories;

  HomeModel({
    required this.allProducts,
    required this.newProducts,
    required this.mostSales,
    required this.categories,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    allProducts: List<AllProduct>.from(json["all_products"].map((x) => AllProduct.fromJson(x))),
    newProducts: List<AllProduct>.from(json["new_products"].map((x) => AllProduct.fromJson(x))),
    mostSales: List<AllProduct>.from(json["most_sales"].map((x) => AllProduct.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "all_products": List<dynamic>.from(allProducts.map((x) => x.toJson())),
    "new_products": List<dynamic>.from(newProducts.map((x) => x.toJson())),
    "most_sales": List<dynamic>.from(mostSales.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class AllProduct {
  int id;
  String title;
  String slug;
  dynamic thumbnailImage;
  double price;
  int discount;
  Category category;
  List<Tag> tags;

  AllProduct({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.category,
    required this.tags,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    thumbnailImage: json["thumbnail_image"],
    price: json["price"]?.toDouble(),
    discount: json["discount"],
    category: Category.fromJson(json["category"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "thumbnail_image": thumbnailImage,
    "price": price,
    "discount": discount,
    "category": category.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String? thumbnailImage;

  Category({
    required this.id,
    required this.name,
    required this.thumbnailImage
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    'thumbnail_image': thumbnailImage
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

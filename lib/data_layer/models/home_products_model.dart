// To parse this JSON data, do
//
//     final homeProductModel = homeProductModelFromJson(jsonString);

import 'dart:convert';

HomeProductModel homeProductModelFromJson(String str) =>
    HomeProductModel.fromJson(json.decode(str));

String homeProductModelToJson(HomeProductModel data) =>
    json.encode(data.toJson());

class HomeProductModel {
  List<AllProduct>? allProducts;
  List<AllProduct>? newProducts;
  List<AllProduct>? mostSales;

  HomeProductModel({
    this.allProducts,
    this.newProducts,
    this.mostSales,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      HomeProductModel(
        allProducts: json["all_products"] == null
            ? []
            : List<AllProduct>.from(
                json["all_products"]!.map((x) => AllProduct.fromJson(x))),
        newProducts: json["new_products"] == null
            ? []
            : List<AllProduct>.from(
                json["new_products"]!.map((x) => AllProduct.fromJson(x))),
        mostSales: json["most_sales"] == null
            ? []
            : List<AllProduct>.from(
                json["most_sales"]!.map((x) => AllProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "all_products": allProducts == null
            ? []
            : List<dynamic>.from(allProducts!.map((x) => x.toJson())),
        "new_products": newProducts == null
            ? []
            : List<dynamic>.from(newProducts!.map((x) => x.toJson())),
        "most_sales": mostSales == null
            ? []
            : List<dynamic>.from(mostSales!.map((x) => x.toJson())),
      };
}

class AllProduct {
  int? id;
  String? title;
  String? slug;
  dynamic thumbnailImage;
  double? price;
  int? discount;
  Category? category;
  List<Tag>? tags;

  AllProduct({
    this.id,
    this.title,
    this.slug,
    this.thumbnailImage,
    this.price,
    this.discount,
    this.category,
    this.tags,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        thumbnailImage: json["thumbnail_image"],
        price: json["price"]?.toDouble(),
        discount: json["discount"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "thumbnail_image": thumbnailImage,
        "price": price,
        "discount": discount,
        "category": category?.toJson(),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? name;
  int? parent;

  Category({
    this.id,
    this.name,
    this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent": parent,
      };
}

class Tag {
  int? id;
  String? name;

  Tag({
    this.id,
    this.name,
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

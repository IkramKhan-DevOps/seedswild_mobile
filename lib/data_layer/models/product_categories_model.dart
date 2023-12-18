import 'dart:convert';

List<ProductCategory> productCategoryFromJson(String str) =>
    List<ProductCategory>.from(json.decode(str).map((x) => ProductCategory.fromJson(x)));

String productCategoryToJson(List<ProductCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategory {
  int id;
  String name;
  dynamic thumbnailImage;
  dynamic bannerImage;

  ProductCategory({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.bannerImage,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
    bannerImage: json["banner_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail_image": thumbnailImage,
    "banner_image": bannerImage,
  };
}

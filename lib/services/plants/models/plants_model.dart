import 'dart:convert';

class PlantModel {
  final int id;
  final String name;
  final String? nameInYourLanguage;
  final String image;
  final AICategory category;
  final String? modelId;
  final DateTime plantedOn;
  final DateTime createdOn;

  PlantModel({
    required this.id,
    required this.name,
    this.nameInYourLanguage,
    required this.image,
    required this.category,
    this.modelId,
    required this.plantedOn,
    required this.createdOn,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      nameInYourLanguage: json['name_in_your_language'],
      image: json['image'],
      category: AICategory.fromJson(json['category']),
      modelId: json['model_id'],
      plantedOn: DateTime.parse(json['planted_on']),
      createdOn: DateTime.parse(json['created_on']),
    );
  }

  static List<PlantModel> parseList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PlantModel>((json) => PlantModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_in_your_language': nameInYourLanguage,
      'image': image,
      'category': category.toJson(),
      'model_id': modelId,
      'planted_on': plantedOn.toIso8601String(),
      'created_on': createdOn.toIso8601String(),
    };
  }
}

class AICategory {
  final int id;
  final String name;

  AICategory({
    required this.id,
    required this.name,
  });

  factory AICategory.fromJson(Map<String, dynamic> json) {
    return AICategory(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

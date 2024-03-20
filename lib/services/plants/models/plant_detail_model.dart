import 'dart:convert';

class PlantDetailModel {
  final int id;
  final String name;
  final String? nameInYourLanguage;
  final String? seedName;
  final String? otherNames;
  final String image;
  final String? description;
  final AICategory category;
  final String? modelId;
  final DateTime plantedOn;
  final DateTime createdOn;
  final List<Fertilizer> fertilizers;
  final List<Alert> alerts;
  final Cultivation? cultivation; // Make cultivation nullable

  final Weather weather;

  PlantDetailModel({
    required this.id,
    required this.name,
    this.nameInYourLanguage,
    this.seedName,
    this.otherNames,
    required this.image,
    this.description,
    required this.category,
    this.modelId,
    required this.plantedOn,
    required this.createdOn,
    required this.fertilizers,
    required this.alerts,
    this.cultivation, // Update parameter to be nullable
    required this.weather,
  });

  factory PlantDetailModel.fromJson(Map<String, dynamic> json) {
    return PlantDetailModel(
      id: json['id'],
      name: json['name'],
      nameInYourLanguage: json['name_in_your_language'],
      seedName: json['seed_name'],
      otherNames: json['other_names'],
      image: json['image'],
      description: json['description'],
      category: AICategory.fromJson(json['category']),
      modelId: json['model_id'],
      plantedOn: DateTime.parse(json['planted_on']),
      createdOn: DateTime.parse(json['created_on']),
      fertilizers: (json['fertilizers'] as List<dynamic>)
          .map((fertilizerJson) => Fertilizer.fromJson(fertilizerJson))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>)
          .map((alertJson) => Alert.fromJson(alertJson))
          .toList(),
      cultivation: json['cultivation'] != null
          ? Cultivation.fromJson(json['cultivation'])
          : null, // Handle null value here
      weather: Weather.fromJson(json['weather']),
    );
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
}

class Fertilizer {
  final int id;
  final String name;

  Fertilizer({
    required this.id,
    required this.name,
  });

  factory Fertilizer.fromJson(Map<String, dynamic> json) {
    return Fertilizer(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Alert {
  final int id;
  final String alertType;
  final String alertMessage;
  final DateTime alertOn;
  final DateTime createdOn;

  Alert({
    required this.id,
    required this.alertType,
    required this.alertMessage,
    required this.alertOn,
    required this.createdOn,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'],
      alertType: json['alert_type'],
      alertMessage: json['alert_message'],
      alertOn: DateTime.parse(json['alert_on']),
      createdOn: DateTime.parse(json['created_on']),
    );
  }
}

class Cultivation {
  final String height;
  final String wateringTime;
  final String area;
  final String depth;
  final String timePeriod;

  Cultivation({
    required this.height,
    required this.wateringTime,
    required this.area,
    required this.depth,
    required this.timePeriod,
  });

  factory Cultivation.fromJson(Map<String, dynamic> json) {
    return Cultivation(
      height: json['height'],
      wateringTime: json['watering_time'],
      area: json['area'],
      depth: json['depth'],
      timePeriod: json['time_period'],
    );
  }
}

class Weather {
  final String weather;
  final String temperature;
  final String humidity;
  final String wind;
  final DateTime date;

  Weather({
    required this.weather,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.date,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: json['weather'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      wind: json['wind'],
      date: DateTime.parse(json['date']),
    );
  }
}

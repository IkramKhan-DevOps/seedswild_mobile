
class CountryModel {
  final String id;
  final String name;

  CountryModel({required this.id, required this.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

}
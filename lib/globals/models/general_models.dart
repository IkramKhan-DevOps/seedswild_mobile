import 'dart:convert';

List<CountryModel> CountryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));
String CountryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  int id;
  String name;
  String shortName;
  String phoneCode;

  CountryModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.phoneCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"],
    name: json["name"],
    shortName: json["short_name"],
    phoneCode: json["phone_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "short_name": shortName,
    "phone_code": phoneCode,
  };
}

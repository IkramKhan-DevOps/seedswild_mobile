
class ProfileModel {
  final int pk;
  final String email;
  final String firstName;
  final String lastName;

  ProfileModel({
    required this.pk,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      pk: json['pk'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

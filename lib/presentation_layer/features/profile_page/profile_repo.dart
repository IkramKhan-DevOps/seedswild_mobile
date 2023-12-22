

// user_repository.dart

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../data_layer/models/profile_model.dart';

class UserRepository {
  final String apiUrl;
  UserRepository(this.apiUrl); // Add this parameter

  Future<ProfileModel?> getUserInfo() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? key = prefs.getString('key');

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Token $key'}, // Add this line
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return ProfileModel.fromJson(jsonData);
      } else {

        return null;
      }
    } catch (e) {
      // Handle error, you can throw an exception or return null
      return null;
    }
  }
}
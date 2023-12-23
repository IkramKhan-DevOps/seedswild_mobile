import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data_layer/models/user_model.dart';

class UserProvider with ChangeNotifier {

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("key", user.key.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> loadUser() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? key = sharedPreferences.getString('key');
    return UserModel(key: key);
  }

  Future<bool> removeToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('key');
    return true;
  }
}

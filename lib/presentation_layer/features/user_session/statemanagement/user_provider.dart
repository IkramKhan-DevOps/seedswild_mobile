import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data_layer/models/user_model.dart';

class UserProvider with ChangeNotifier {
//....................................... SAVE USER TOKEN.......................
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("key", user.key.toString());
    notifyListeners();
    return true;
  }

  //....................................... LOAD USER TOKEN.....................
  Future<UserModel> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? key = prefs.getString('key');

    return UserModel(key: key);
  }

  //....................................... REMOVE USER TOKEN....................
  Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('key');
    return true;
  }
}

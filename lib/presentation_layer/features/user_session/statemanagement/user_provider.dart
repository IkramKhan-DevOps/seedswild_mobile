import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data_layer/models/user_model.dart';

class UserProvider with ChangeNotifier {
//....................................... SAVE USER TOKEN.......................
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  //....................................... LOAD USER TOKEN.....................
  Future<UserModel> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return UserModel(token: token);
  }

  //....................................... REMOVE USER TOKEN....................
  Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return true;
  }
}

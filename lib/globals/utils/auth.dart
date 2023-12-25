import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes/app_routes.dart';

class AuthToken{

  static Future saveToken(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("key", key);
  }

  static Future<String?> getToken() async {
    try{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final String? key = sharedPreferences.getString('key');
      return key;
    }catch(e){
      return null;
    }
  }

  static Future<bool> removeToken() async {
    try{

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove('key');
      return true;

    }catch(e){
      return false;
    }
  }

  static checkLoginStatus(BuildContext context){

    AuthToken.getToken().then((value) async {

      if(value == null || value == ""){
        print("login");
        Navigator.pushNamed(context, AppRoutes.loginScreen);
      }else{
        print("home");
        Navigator.pushNamed(context, AppRoutes.homePage);
      }

    }).onError((error, stackTrace) {
      print(error.toString());
    });

  }

  static Future<void> logoutUser(BuildContext context) async {
    AuthToken.removeToken().then((value){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushNamed(context, AppRoutes.loginScreen);
    });
  }

}

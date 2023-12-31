import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/models/profile_model.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/globals/utils/who_am_i.dart';
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
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      }else{
        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      }

    }).onError((error, stackTrace) {
      print(error.toString());
    });

  }

  static Future<void> afterLogin() async {
    BaseApiService apiService = NetworkApiService();
    ProfileModel profileModel;

    try{

      var response = await apiService.getAPI(AppUrls.profile, true);
      profileModel = ProfileModel.fromJson(response);
      WhoIAm.saveUser(profileModel: profileModel);

    }catch(error){
      print(error.toString());
    }

  }

  static Future<void> logoutUser(BuildContext context) async {
    AuthToken.removeToken().then((value) async {
      await WhoIAm.removeUser();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

}

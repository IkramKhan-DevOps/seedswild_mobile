import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data%20layer/models/user_model.dart';
import 'package:annafi_app/presentation%20layer/features/user_session/statemanagement/user_provider.dart';
import 'package:flutter/material.dart';

class UserServices {
  Future<UserModel> getloadUsertoken() => UserProvider().loadUser();
  void checkUserAuthentication(BuildContext context) async {
    getloadUsertoken().then((value) async {
      print("token Status : " + value.token.toString());
      if (value.token.toString() == 'null' || value.token.toString() == '') {
        // await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, AppRoutes.signInScreen);
      } else {
        // await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, AppRoutes.homePage);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}

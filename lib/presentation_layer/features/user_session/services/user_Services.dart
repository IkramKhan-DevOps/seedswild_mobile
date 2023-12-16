import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/models/user_model.dart';
import 'package:annafi_app/presentation_layer/features/user_session/statemanagement/user_provider.dart';
import 'package:flutter/material.dart';

class UserServices {
  Future<UserModel> getloadUsertoken() => UserProvider().loadUser();
  void checkUserAuthentication(BuildContext context) async {
    getloadUsertoken().then((value) async {
      print("token Status : " + value.key.toString());
      if (value.key.toString() == 'null' || value.key.toString() == '') {
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

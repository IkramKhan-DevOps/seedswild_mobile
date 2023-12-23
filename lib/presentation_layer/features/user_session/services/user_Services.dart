import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/models/user_model.dart';
import 'package:annafi_app/presentation_layer/features/user_session/statemanagement/user_provider.dart';
import 'package:flutter/material.dart';

class UserServices {
  Future<UserModel> getUser() => UserProvider().loadUser();

  void
  checkUserAuthentication(BuildContext context) async {
    getUser().then((value) async {
      if (value.key.toString() == 'null' || value.key.toString() == '') {
        Navigator.pushNamed(context, AppRoutes.signInScreen);
      } else {
        Navigator.pushNamed(context, AppRoutes.homePage);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}

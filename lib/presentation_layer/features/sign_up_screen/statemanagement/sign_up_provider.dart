import 'package:annafi_app/presentation_layer/features/sign_up_screen/repository/sign_up_repo.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../utils/custom show messages/flush_bar_message_component.dart';
import '../../../../utils/routes/app_routes.dart';

class SignUpProvider with ChangeNotifier {
  var _signUpRep = SignUpRepo();
  bool _signUploading = false;
  bool get signUploading => _signUploading;
  setLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  bool _obsecure = true;
  bool get obsecure => _obsecure;
  setObsecure() {
    _obsecure = !_obsecure;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _signUpRep.signUpApi(data).then((value) {
      setLoading(false);
      CustomFlushBarMessage.flushbarErrorMessage(
          "Sign Up", ColorConstant.mainGreenColor, 'Sign Up Success', context);
      print("Test provide value extraction : " + value.toString());
      onTapHome(context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      CustomFlushBarMessage.flushbarErrorMessage(
          error.toString(), ColorConstant.mainGreenColor, 'Api Test', context);
    });
  }
}

onTapHome(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.signInScreen);
}

import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/error_handling/app_errors.dart';
import '../../../../data_layer/urls/app_urls.dart';

class SignUpProvider with ChangeNotifier {

  BaseApiService apiServices = NetworkApiService();
  bool _signUploading = false;

  bool get signUploading => _signUploading;

  setLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  bool _obSecurePassword1 = true;
  bool _obSecurePassword2 = true;

  bool get obSecurePassword1 => _obSecurePassword1;
  bool get obSecurePassword2 => _obSecurePassword2;

  setObSecurePassword(password) {
    switch (password) {
      case "p1":
        _obSecurePassword1 = !_obSecurePassword1;
        break;

      case "p2":
        _obSecurePassword2 = !_obSecurePassword2;
        break;
    }
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    try {

      var response = await apiServices.postAPI(AppUrls.signUp, data);
      print(response);
      ErrorMessage.flushBar(context, "Registration successful! please verify your email.");
      setLoading(false);
      notifyListeners();

    } catch (error) {

      ErrorMessage.flushBar(context, error.toString(), "danger");
      setLoading(false);
      notifyListeners();
    }
  }
}
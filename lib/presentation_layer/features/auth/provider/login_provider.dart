import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/error_handling/app_errors.dart';
import 'package:annafi_app/globals/utils/auth.dart';
import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/urls/app_urls.dart';


class LoginProvider with ChangeNotifier {

  // attributes
  BaseApiService apiServices = NetworkApiService();
  bool _loading = false;
  bool _obSecure = true;

  // getters
  bool get loading => _loading;
  bool get obSecure => _obSecure;

  // setters
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setObSecure() {
    _obSecure = !_obSecure;
    notifyListeners();
  }

  // API CALL
  Future<void> loginAPI(dynamic data, BuildContext context) async {

    setLoading(true);
    try {

      var response = await apiServices.postAPI(AppUrls.signIn, data);
      AuthToken.saveToken(response['key']);
      setLoading(false);
      Navigator.pushNamed(context, AppRoutes.homePage);

    } catch (error) {

      setLoading(false);
      ErrorMessage.flushBar(context, error.toString(), "danger");
    }

  }
}

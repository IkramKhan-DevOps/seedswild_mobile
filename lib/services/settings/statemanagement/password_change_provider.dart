
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';

class PasswordChangeProvider with ChangeNotifier{
  BaseApiService apiServices = NetworkApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> postPasswordChangeAPICall(BuildContext context, dynamic data) async {

    this._isLoading = true;
    try{
      print(AppUrls.passwordChange);
      var response = await apiServices.postAPI(AppUrls.passwordChange, data, true);
      this._isLoading = false;

      ErrorMessage.flushBar(context, "Your password changed Successfully.");
    }catch (error){

      this._isLoading = false;
      ErrorMessage.flushBar(context, error.toString(), "danger");
    }

  }
}
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:flutter/material.dart';

class PasswordResetProvider with ChangeNotifier{
  BaseApiService service = NetworkApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> forgetAPICall(BuildContext context, dynamic data) async{

    try{

      _isLoading = true;
      notifyListeners();

      var response = await service.postAPI(AppUrls.passwordReset, data);
      ErrorMessage.flushBar(context, "Password reset link sent to your email");
      _isLoading = false;
      notifyListeners();

    }catch (error){

      ErrorMessage.flushBar(context, error.toString(), "danger");
      _isLoading = false;
      notifyListeners();

    }
  }

}
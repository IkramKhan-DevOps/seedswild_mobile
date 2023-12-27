
import 'package:annafi_app/data_layer/error_handling/app_errors.dart';
import 'package:flutter/material.dart';
import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/models/profile_model.dart';
import '../../../../data_layer/urls/app_urls.dart';

class ProfileProvider with ChangeNotifier {
  BaseApiService apiServices = NetworkApiService();

  bool isLoading = false;
  // attributes
  late ProfileModel? _userModel;

  //getters
  ProfileModel? get userModel => _userModel;

  // API Calls
  Future<void> getProfileAPICAll(BuildContext context) async {

    try {

      var response = await apiServices.getAPI(AppUrls.profile, true);
      _userModel = ProfileModel.fromJson(response);

      notifyListeners();

    } catch (e) {
      ErrorMessage.flushBar(context, e.toString(), "danger");
      notifyListeners();
    }
  }

  Future<void> putProfileAPICall(dynamic data, BuildContext context) async {
    this.isLoading = true;

    try{

      var response = await apiServices.putAPI(AppUrls.profile, data);
      _userModel = ProfileModel.fromJson(response);
      this.isLoading = false;

      ErrorMessage.flushBar(context, "Profile updated successfully");
      notifyListeners();

    }catch (e){
      this.isLoading = false;
      ErrorMessage.flushBar(context, e.toString(), "danger");
    }

  }

}

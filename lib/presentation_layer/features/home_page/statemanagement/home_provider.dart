import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/error_handling/app_errors.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';
import 'package:annafi_app/presentation_layer/features/home_page/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';

class HomeProvider with ChangeNotifier {
  BaseApiService baseApiService = new NetworkApiService();
  HomeModel? homeModel;
  bool isLoading = false;

  Future<void> homeAPICall(BuildContext context) async {
    this.isLoading = true;
    try{
      var response = await baseApiService.getAPI(AppUrls.home);
      homeModel = HomeModel.fromJson(response);

      this.isLoading = false;
    }catch(e){
      ErrorMessage.flushBar(context, e.toString());
      this.isLoading = false;
    }
    notifyListeners();
  }

}

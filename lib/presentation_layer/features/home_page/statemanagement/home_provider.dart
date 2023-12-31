import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/presentation_layer/features/home_page/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';

class HomeProvider with ChangeNotifier {
  BaseApiService baseApiService = new NetworkApiService();
  HomeModel? homeModel;

  Future<void> homeAPICall(BuildContext context) async {
    try{
      var response = await baseApiService.getAPI(AppUrls.home);
      homeModel = HomeModel.fromJson(response);
      notifyListeners();

    }catch(e){
      notifyListeners();
      ErrorMessage.flushBar(context, e.toString());
    }
  }

}

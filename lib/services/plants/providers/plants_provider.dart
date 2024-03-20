

import 'package:flutter/cupertino.dart';
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/services/plants/models/plants_model.dart';

class PlantsProvider with ChangeNotifier{
  BaseApiService apiService = NetworkApiService();
  List<PlantModel> plants = [];

  Future<void> getPlantsAPI(BuildContext context) async {
    try {
      String url = "${AppUrls.plants}";
      print(url);
      var response = await apiService.getAPI(url, true);

      List<dynamic> jsonList = response as List<dynamic>;
      plants = jsonList.map((json) => PlantModel.fromJson(json)).toList();

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
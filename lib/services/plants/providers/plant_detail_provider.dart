

import 'package:flutter/cupertino.dart';
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/services/plants/models/plant_detail_model.dart';

class PlantDetailProvider with ChangeNotifier {

  BaseApiService apiService = NetworkApiService();
  PlantDetailModel? plantDetailModel;

  Future<void> getPlantDetailAPI(BuildContext context, String id) async{

    String url = "${AppUrls.plantDetail}${id}/";
    try{

      var response = await apiService.getAPI(url, true);
      print(response);
      plantDetailModel = PlantDetailModel.fromJson(response);

    }catch (e){
      print(e);
    }

  }

}
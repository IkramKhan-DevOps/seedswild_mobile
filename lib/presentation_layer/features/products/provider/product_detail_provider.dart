import 'package:annafi_app/data_layer/data/network/base_api_services.dart';
import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';
import 'package:annafi_app/presentation_layer/features/products/models/product_detail_model.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider with ChangeNotifier {
  BaseApiService service = NetworkApiService();
  ProductDetailModel? productModel;

  Future<void> getProductAPI(BuildContext context, String id) async {
    try {
      String url = "${AppUrls.product}${id}/";
      var response = await service.getAPI(url);
      productModel = ProductDetailModel.fromJson(response);

    } catch (error) {
      print(error.toString());
    }
  }
}

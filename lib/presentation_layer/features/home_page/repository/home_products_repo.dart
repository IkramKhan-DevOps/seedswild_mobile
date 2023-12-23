import 'package:annafi_app/data_layer/data/network/base_api_services.dart';
import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/models/home_products_model.dart';

import '../../../../data_layer/urls/app_urls.dart';

class AllProductsRepo {
  BaseApiService _allProductsRepo = NetworkApiService();

  Future<List<HomeProductModel>?> getAllProduct() async {
    try {
      dynamic response =
          await _allProductsRepo.getAPI(AppUrls.homeProducts);
      // print("Response from API: $response");

      if (response != null) {
        // Call the static method correctly
        return (response as List<dynamic>)
            .map((categoryJson) => HomeProductModel.fromJson(categoryJson))
            .toList();
      }

      return null;
    } catch (e) {
      print("Error fetching product categories: $e");
      return null;
    }
  }
}

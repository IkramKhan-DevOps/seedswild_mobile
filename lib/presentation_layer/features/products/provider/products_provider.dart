import 'package:annafi_app/data_layer/data/network/base_api_services.dart';
import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';
import 'package:annafi_app/presentation_layer/features/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  BaseApiService service = NetworkApiService();
  ProductModel? productModel;
  int limit = 10;
  final TextEditingController searchController = TextEditingController();

  Future<void> getProductsAPI(BuildContext context) async {
    print("Search");
    try {
      String url = "${AppUrls.product}?title=${searchController.text}&limit=$limit";
      var response = await service.getAPI(url);
      productModel = ProductModel.fromJson(response);
    } catch (error) {
      productModel = ProductModel(
          count: 0, next: "", previous: "", results: []
      );
    }
  }

  Future<void> filterProduct(BuildContext context) async {
    print("Filter");
    try {
      String url = "${AppUrls.product}?title=${searchController.text}&limit=$limit";
      var response = await service.getAPI(url);
      productModel = ProductModel.fromJson(response);
      notifyListeners();
    } catch (error) {
      productModel = ProductModel(
          count: 0, next: "", previous: "", results: []
      );
      notifyListeners();
    }
  }

}

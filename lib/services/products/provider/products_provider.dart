import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/services/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {

  // CORE
  BaseApiService service = NetworkApiService();
  ProductModel? productModel;

  // QUERIES
  final TextEditingController searchController = TextEditingController();
  int limit = 10;
  String category = '';
  String rating = '';

  void setCategory(id){
    category = id;
    notifyListeners();
  }

  void resetQuery(BuildContext context){
    category = '';
    rating = '';
    searchController.text = '';
    filterProduct(context);
  }

  void submitQuery(BuildContext context){
    filterProduct(context);
  }

  Future<void> getProductsAPI(BuildContext context) async {
    try {
      String url = "${AppUrls.product}?title=${searchController.text}&category=${category}&limit=$limit";

      var response = await service.getAPI(url);
      productModel = ProductModel.fromJson(response);
    } catch (error) {
      productModel = ProductModel(
          count: 0, next: "", previous: "", results: []
      );
    }
  }

  Future<void> filterProduct(BuildContext context) async {
    try {
      String url = "${AppUrls.product}?title=${searchController.text}&category=${category}&limit=$limit";
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

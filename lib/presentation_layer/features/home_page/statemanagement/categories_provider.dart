// CategoriesProvider.dart
import 'package:flutter/material.dart';

import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/models/product_categories_model.dart';
import '../../../../data_layer/urls/app_urls.dart';
import '../repository/categories_repo.dart';

// CategoriesProvider.dart
class CategoriesProvider with ChangeNotifier {

  BaseApiService _apiService = NetworkApiService();
  List<ProductCategory>? _productCategories;
  List<ProductCategory>? get productCategories => _productCategories;

  Future<void> fetchProductCategories() async {
    try {
      dynamic response = await _apiService.getAPI(AppUrls.productCategory);
      _productCategories =  List<ProductCategory>.from(response.map((json) => ProductCategory.fromJson(json)));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

}

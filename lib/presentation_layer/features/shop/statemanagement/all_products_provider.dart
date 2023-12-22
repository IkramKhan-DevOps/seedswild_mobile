//its allow the class to notifyits listners when its states are changed(CHANGE NOTIFIER)

import 'package:annafi_app/data_layer/models/home_products_model.dart';
import 'package:annafi_app/presentation_layer/features/shop/repository/all_products_repo.dart';
import 'package:flutter/material.dart';

class AllProductsProvider with ChangeNotifier {
// "_categoriesRepo" is a instance of CategoriesRepo is used to interact with the
// repository class (CategoriesRepo) to fetch product categories.
  AllProductsRepo _allProductsRepo = AllProductsRepo();
//"?" is use for null , it may be a categoryProductmodel or "null".
  List<HomeProductModel>? _allProductModels;

//A getter method for accessing the _productCategory property from outside the class.
  List<HomeProductModel>? get allproductModels =>
      _allProductModels; // Keep this line/ Change this line

  Future<void> fetchAllProduct() async {
    try {
      _allProductModels = await _allProductsRepo.getAllProduct();
      notifyListeners(); // Ensure to call this after updating the data
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}

// CategoriesProvider.dart
import 'package:flutter/material.dart';

import '../../../../data layer/models/product_categories_model.dart';
import '../repository/categories_repo.dart';

// CategoriesProvider.dart
class CategoriesProvider with ChangeNotifier {
  CategoriesRepo _categoriesRepo = CategoriesRepo();
  ProductCategory? _productCategory;

  ProductCategory? get productCategory => _productCategory;

  Future<void> fetchProductCategories() async {
    try {
      _productCategory = await _categoriesRepo.getProductCategories();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

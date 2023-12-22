// CategoriesProvider.dart
import 'package:flutter/material.dart';

import '../../../../data_layer/models/product_categories_model.dart';
import '../repository/categories_repo.dart';

// CategoriesProvider.dart
class CategoriesProvider with ChangeNotifier {
  CategoriesRepo _categoriesRepo = CategoriesRepo();
  List<ProductCategory>? _productCategories;

  List<ProductCategory>? get productCategories => _productCategories;

  Future<void> fetchProductCategories() async {
    try {
      _productCategories = await _categoriesRepo.getProductCategories();
      notifyListeners();
    } catch (e) {}
  }
}

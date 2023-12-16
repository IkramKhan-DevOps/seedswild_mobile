import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/models/product_categories_model.dart';
import '../../../../data_layer/urls/app_urls.dart';

// CategoriesRepo.dart
// CategoriesRepo.dart
class CategoriesRepo {
  BaseApiService _apiService = NetworkApiService();
  Future<ProductCategory?> getProductCategories() async {
    try {
      dynamic response =
          await _apiService.getGetApiServices(AppUrls.productsCategUrl);
      print("Response from API: $response");

      if (response != null) {
        return ProductCategory.fromJson(response);
      }

      return null;
    } catch (e) {
      print("Error fetching product categories: $e");
      return null;
    }
  }
}

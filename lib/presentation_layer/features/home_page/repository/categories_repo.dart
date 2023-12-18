import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/models/product_categories_model.dart';
import '../../../../data_layer/urls/app_urls.dart';

class CategoriesRepo {
  // ... existing code ...
  BaseApiService _apiService = NetworkApiService();
  Future<List<ProductCategory>?> getProductCategories() async {
    try {
      dynamic response = await _apiService.getGetApiServices(AppUrls.productCategory);

      if (response != null) {
        if (response is List) {
          return List<ProductCategory>.from(response.map((json) => ProductCategory.fromJson(json)));
        } else {
          return [ProductCategory.fromJson(response)];
        }
      }
      return null;
    } catch (e) {
      print("Error fetching product categories: $e");
      return null;
    }
  }
}

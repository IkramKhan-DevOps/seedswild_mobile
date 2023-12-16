import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';

import '../../../../data_layer/data/network/base_api_services.dart';

class SignUpRepo {
  BaseApiService apiServices = NetworkApiService();

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      var response =
          await apiServices.getPostApiServices(AppUrls.signUpUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

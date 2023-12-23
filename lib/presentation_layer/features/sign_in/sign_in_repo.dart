import 'package:annafi_app/data_layer/data/network/base_api_services.dart';
import 'package:annafi_app/data_layer/data/network/network_api_services.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';

class SignInRepo {
  BaseApiService apiServices = NetworkApiService();

  Future<dynamic> signInApi(dynamic data) async {
    try {
      var response = await apiServices.postAPI(AppUrls.signIn, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}


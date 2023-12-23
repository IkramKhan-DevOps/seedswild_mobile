abstract class BaseApiService {

  Future<dynamic> getAPI(String url, [bool isToken]);
  Future<dynamic> postAPI(String url, dynamic data, [bool isToken]);
  Future<dynamic> putAPI(String url, dynamic data);

}

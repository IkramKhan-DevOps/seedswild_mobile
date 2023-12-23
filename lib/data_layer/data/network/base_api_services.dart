abstract class BaseApiService {

  Future<dynamic> getAPI(String url);
  Future<dynamic> postAPI(String url, dynamic data);

}

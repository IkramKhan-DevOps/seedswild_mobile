abstract class BaseApiService {
  Future<dynamic> getGetApiServices(String url);
  Future<dynamic> getPostApiServices(String url, dynamic data);
}

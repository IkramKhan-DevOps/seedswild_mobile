import 'dart:convert';
import 'dart:io';

import 'package:annafi_app/data_layer/error_handling/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'base_api_services.dart';

class NetworkApiService extends BaseApiService {
  // ......................GET API ................................
  @override
  Future getGetApiServices(String url) async {
    dynamic responseJson;
    try {
      Response response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;
  }

  // ......................POST API ................................

  @override
  Future getPostApiServices(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 15));

      ;
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }

    return responseJson;
  }

  // ......................STATUS CODEs................................

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnautherizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with the server" +
                "Status code is " +
                response.statusCode.toString());
    }
  }
}

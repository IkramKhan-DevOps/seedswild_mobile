import 'dart:convert';
import 'dart:io';

import 'package:annafi_app/data_layer/error_handling/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'base_api_services.dart';

class NetworkApiService extends BaseApiService {

  @override
  Future getAPI(String url) async {
    try {

      Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      return this.validateAPIResponse(response);

    } on SocketException {
      throw FetchDataException("No internet connection available.");
    }
  }

  @override
  Future postAPI(String url, dynamic data) async {
    try {

      final response = await post(Uri.parse(url), body: data).timeout(Duration(seconds: 15));
      return this.validateAPIResponse(response);

    } on SocketException {
      throw FetchDataException("No internet connection available.");
    }
  }

  dynamic validateAPIResponse(http.Response response) {
    /// 201: created - 200: okay
    /// 404: not found - 400: bad request

    switch (response.statusCode) {

      case 201:
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
          "Communication Error: " + response.statusCode.toString(),
        );
    }
  }

  String captureResponseErrors(var response) {
    return response.toString();
  }
}

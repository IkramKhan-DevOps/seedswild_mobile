import 'dart:convert';
import 'dart:io';

import 'package:seedswild/data_layer/error_handling/app_exception.dart';
import 'package:seedswild/globals/utils/auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_api_services.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getAPI(String url, [bool isToken = false]) async {
    try {
      Response res;
      if (isToken) {
        res = await http.get(
          Uri.parse(url),
          headers: {'Authorization': 'Token ${await AuthToken.getToken()}'},
        ).timeout(
          Duration(seconds: 10),
        );
      } else {
        res = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      }
      return this.validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException("No internet connection available.");
    }
  }

  @override
  Future postAPI(String url, dynamic data, [bool isToken = false]) async {
    try {
      Response res;

      if (isToken) {

        res = await http.post(
          Uri.parse(url),
          body: data,
          headers: {
            'Authorization': 'Token ${await AuthToken.getToken()}',
            'Content-Type': 'application/json',
          },
        ).timeout(
          Duration(seconds: 15),
        );
      } else {
        res = await post(Uri.parse(url), body: data)
            .timeout(Duration(seconds: 15));
      }
      return this.validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException("No internet connection available.");
    }
  }

  @override
  Future putAPI(String url, dynamic data) async {
    try {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? key = prefs.getString('key');

      Response res = await http.put(
        Uri.parse(url),
        body: data,
        headers: {'Authorization': 'Token $key'},
      ).timeout(
        Duration(seconds: 15),
      );
      return this.validateAPIResponse(res);

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
        throw response.body.toString();
    }
  }

  String captureResponseErrors(var response) {
    return response.toString();
  }
}

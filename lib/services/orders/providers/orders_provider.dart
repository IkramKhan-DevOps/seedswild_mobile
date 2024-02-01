

import 'package:flutter/cupertino.dart';
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/services/orders/models/orders_model.dart';


class OrdersProvider extends ChangeNotifier {
  BaseApiService apiService = new NetworkApiService();
  List<OrdersModel>? orders;

  Future<void> ordersAPICall(BuildContext context) async {
    try {
      var response = await apiService.getAPI(AppUrls.order, true);
      List<dynamic> jsonList = response as List<dynamic>;

      orders = jsonList.map((json) => OrdersModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      ErrorMessage.flushBar(context, e.toString());
      notifyListeners();
    }
  }
}
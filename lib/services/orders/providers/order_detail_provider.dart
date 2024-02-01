import 'package:flutter/cupertino.dart';
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/services/orders/models/order_detail_model.dart';

class OrderDetailProvider extends ChangeNotifier {
  BaseApiService apiService = new NetworkApiService();
  OrderDetailModel? orderDetail;

  Future<void> orderDetailAPICall(BuildContext context, int id) async {

    try{

      String url = "${AppUrls.v1AppBase}order/$id/";
      var response = await apiService.getAPI(url, true);
      orderDetail = OrderDetailModel.fromJson(response);

    }catch(e){
      ErrorMessage.flushBar(context, e.toString(), "danger");
    }
  }
}

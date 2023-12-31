import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:flutter/material.dart';

import '../models/notification_model.dart';

class NotificationProvider with ChangeNotifier {
  BaseApiService service = NetworkApiService();
  NotificationModel? notifications;

  Future<void> getNotifications(BuildContext context) async {
    try {
      var response = await service.getAPI(AppUrls.notifications, true);
      print(response);

    } catch (error) {
      print(error.toString());
    }
  }
}

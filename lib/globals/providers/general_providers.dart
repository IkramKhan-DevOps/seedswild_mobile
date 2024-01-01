import 'package:flutter/cupertino.dart';

class GeneralProvider extends ChangeNotifier {

  Map<String, String> paymentMethods = {
    "1": "Cash on Delivery",
    "2": "Credit Card",
  };
  Map<String, String> countries = {
    "1": "Pakistan",
    "2": "India",
    "3": "China",
    "4": "USA",
    "5": "UK",
  };

  GeneralProvider() {
    _init();
  }

  _init() async {

  }

  Future<void> getCountriesAPI() async {}

}
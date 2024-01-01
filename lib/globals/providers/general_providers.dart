import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:seedswild/data_layer/data/network/base_api_services.dart';
import 'package:seedswild/data_layer/data/network/network_api_services.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/data_layer/urls/app_urls.dart';
import 'package:seedswild/globals/models/general_models.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation_layer/features/cart/cart_model.dart';
import '../../presentation_layer/features/cart/cart_provider.dart';


class GeneralProvider extends ChangeNotifier {
  BaseApiService service = NetworkApiService();
  String? _selectedCountry;
  String? _selectedPaymentMethod;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? get selectedCountry => _selectedCountry;
  String? get selectedPaymentMethod => _selectedPaymentMethod;

  set selectedCountry(String? value) {
    _selectedCountry = value;
    notifyListeners();
  }
  set selectedPaymentMethod(String? value) {
    _selectedPaymentMethod = value;
    notifyListeners();
  }

  Map<String, String> paymentMethods = {
    "cod": "Cash on Delivery",
    "online": "Credit Card",
  };

  List<CountryModel> countries = [];

  GeneralProvider() {
    _init();
  }

  _init() async {
    await getCountriesAPI();
  }

  Future<void> getCountriesAPI() async {
    try {
      var response = await service.getAPI(AppUrls.country);
      List<Map<String, dynamic>> countriesData = List<Map<String, dynamic>>.from(response);
      countries = countriesData.map((json) => CountryModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print("Countries Failed! " + e.toString());
    }
  }

  void submitOrder(BuildContext context, List<Cart> cart) async {

    if (countries.length == 0){
      ErrorMessage.flushBar(context, "Country is required and is missing from Server", "danger");
      return;
    }

    if (_selectedCountry == null || _selectedPaymentMethod == null){
      ErrorMessage.flushBar(context, "Country and Payment Method are required", "danger");
    }

    print("|${_selectedPaymentMethod}|");
    print("|${_selectedCountry}|");

    // Prepare the request body
    Map<String, dynamic> requestBody = {
      "full_name": nameController.text,
      "contact": contactController.text,
      "postal_code": postalCodeController.text,
      "address": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "country": countries.firstWhere((element) => element.name == _selectedCountry).id,
      "payment_type": _selectedPaymentMethod,
      "cart_items": cart.map((item) => {"product_id": int.parse(item.id), "quantity": item.quantity}).toList(),
    };

    OrderModel? order;
    try {
      // Make the API request with the prepared request body
      var response = await service.postAPI(AppUrls.order, jsonEncode(requestBody), true);
      order = OrderModel.fromJson(response);



      if (order.sessionUrl != null) {
        ErrorMessage.flushBar(context, "Order Placed Successfully - You will be redirected to Payments page", "success");
        Future.delayed(Duration(seconds: 4), (){});

        CartProvider cartProvider = CartProvider();
        cartProvider.clearCart();

        Future.delayed(Duration(seconds: 5), (){});
        ErrorMessage.flushBar(context, "Order Placed Successfully", "success");
      }

    } catch (e) {
      ErrorMessage.flushBar(context, e.toString(), "danger");
    }
  }



}

class OrderModel {
  String? sessionUrl;
  Data? data;

  OrderModel({this.sessionUrl, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    sessionUrl = json['session_url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_url'] = this.sessionUrl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullName;
  String? contact;
  String? postalCode;
  String? address;
  String? city;
  String? state;
  int? country;
  String? paymentType;
  List<CartItems>? cartItems;

  Data(
      {this.fullName,
        this.contact,
        this.postalCode,
        this.address,
        this.city,
        this.state,
        this.country,
        this.paymentType,
        this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    contact = json['contact'];
    postalCode = json['postal_code'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    paymentType = json['payment_type'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['contact'] = this.contact;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['payment_type'] = this.paymentType;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? productId;
  int? quantity;

  CartItems({this.productId, this.quantity});

  CartItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
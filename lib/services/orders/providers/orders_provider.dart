

import 'package:flutter/cupertino.dart';

import '../models/orders_model.dart';

class OrdersProvider extends ChangeNotifier{

  List<OrdersModel> orders = [
    OrdersModel(orderId: '1', createdOn: '1st Jan, 2024', status: 'completed'),
    OrdersModel(orderId: '2', createdOn: '11th Jan, 2024', status: 'pending'),
    OrdersModel(orderId: '3', createdOn: '21st Jan, 2024', status: 'delivery'),
    OrdersModel(orderId: '4', createdOn: '22th Jan, 2024', status: 'completed'),
    OrdersModel(orderId: '5', createdOn: '30th Jan, 2024', status: 'completed'),
  ];

}
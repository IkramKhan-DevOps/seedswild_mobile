import 'package:flutter/foundation.dart';

class OrderDetailModel {
  final int id;
  final String fullName;
  final String contact;
  final String postalCode;
  final String address;
  final String city;
  final String state;
  final Country country;
  final String paymentType;
  final double total;
  final double serviceCharges;
  final double subTotal;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdOn;
  final List<SubOrder> subOrders;

  OrderDetailModel({
    required this.id,
    required this.fullName,
    required this.contact,
    required this.postalCode,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.paymentType,
    required this.total,
    required this.serviceCharges,
    required this.subTotal,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdOn,
    required this.subOrders,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      contact: json['contact'] as String,
      postalCode: json['postal_code'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: Country.fromJson(json['country']),
      paymentType: json['payment_type'] as String,
      total: json['total'] as double,
      serviceCharges: json['service_charges'] as double,
      subTotal: json['sub_total'] as double,
      orderStatus: json['order_status'] as String,
      paymentStatus: json['payment_status'] as String,
      createdOn: DateTime.parse(json['created_on'] as String),
      subOrders: (json['sub_orders'] as List<dynamic>)
          .map((subOrderJson) => SubOrder.fromJson(subOrderJson))
          .toList(),
    );
  }
}

class Country {
  final int id;
  final String name;
  final String shortName;
  final String phoneCode;

  Country({
    required this.id,
    required this.name,
    required this.shortName,
    required this.phoneCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int,
      name: json['name'] as String,
      shortName: json['short_name'] as String,
      phoneCode: json['phone_code'] as String,
    );
  }
}

class SubOrder {
  final int id;
  final double total;
  final double subTotal;
  final double serviceCharges;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdOn;
  final List<OrderItem> orderItems;
  final Vendor shop;
  final Shipment shipment;

  SubOrder({
    required this.id,
    required this.total,
    required this.subTotal,
    required this.serviceCharges,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdOn,
    required this.orderItems,
    required this.shop,
    required this.shipment,
  });

  factory SubOrder.fromJson(Map<String, dynamic> json) {
    return SubOrder(
      id: json['id'] as int,
      total: json['total'] as double,
      subTotal: json['sub_total'] as double,
      serviceCharges: json['service_charges'] as double,
      orderStatus: json['order_status'] as String,
      paymentStatus: json['payment_status'] as String,
      createdOn: DateTime.parse(json['created_on'] as String),
      orderItems: (json['order_items'] as List<dynamic>)
          .map((orderItemJson) => OrderItem.fromJson(orderItemJson))
          .toList(),
      shop: Vendor.fromJson(json['shop']),
      shipment: Shipment.fromJson(json['shipment']),
    );
  }
}

class OrderItem {
  final SubOrderProductList product;
  final int quantity;

  OrderItem({
    required this.product,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: SubOrderProductList.fromJson(json['product']),
      quantity: json['quantity'] as int,
    );
  }
}

class SubOrderProductList {
  final int id;
  final String title;
  final String? thumbnailImage;
  final double price;
  final int discount;
  final String? promotional;
  final int totalReviews;
  final int averageReview;

  SubOrderProductList({
    required this.id,
    required this.title,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
  });

  factory SubOrderProductList.fromJson(Map<String, dynamic> json) {
    return SubOrderProductList(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailImage: json['thumbnail_image'] as String?,
      price: json['price'] as double,
      discount: json['discount'] as int,
      promotional: json['promotional'] as String?,
      totalReviews: json['total_reviews'] as int,
      averageReview: json['average_review'] as int,
    );
  }
}

class Vendor {
  final int pk;
  final User user;
  final String shopName;

  Vendor({
    required this.pk,
    required this.user,
    required this.shopName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      pk: json['pk'] as int,
      user: User.fromJson(json['user']),
      shopName: json['shop_name'] as String,
    );
  }
}

class User {
  final int id;
  final String username;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}

class Shipment {
  final int id;
  final String? provider;
  final String? trackingId;
  final String? trackingUrl;
  final String? trackingNumber;
  final String shipmentStatus;
  final String? description;
  final DateTime? started;
  final DateTime? reached;

  Shipment({
    required this.id,
    required this.provider,
    required this.trackingId,
    required this.trackingUrl,
    required this.trackingNumber,
    required this.shipmentStatus,
    required this.description,
    required this.started,
    required this.reached,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      id: json['id'] as int,
      provider: json['provider'] as String?,
      trackingId: json['tracking_id'] as String?,
      trackingUrl: json['tracking_url'] as String?,
      trackingNumber: json['tracking_number'] as String?,
      shipmentStatus: json['shipment_status'] as String,
      description: json['description'] as String?,
      started: json['started'] != null
          ? DateTime.parse(json['started'] as String)
          : null,
      reached: json['reached'] != null
          ? DateTime.parse(json['reached'] as String)
          : null,
    );
  }
}

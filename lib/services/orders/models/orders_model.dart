class OrdersModel {

  final int id;
  final String paymentType;
  final double total;
  final double subTotal;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdOn;

  OrdersModel({
    required this.id,
    required this.paymentType,
    required this.total,
    required this.subTotal,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdOn,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'] as int,
      paymentType: json['payment_type'] as String,
      total: (json['total'] as num).toDouble(),
      subTotal: (json['sub_total'] as num).toDouble(),
      orderStatus: json['order_status'] as String,
      paymentStatus: json['payment_status'] as String,
      createdOn: DateTime.parse(json['created_on'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'payment_type': paymentType,
      'total': total,
      'sub_total': subTotal,
      'order_status': orderStatus,
      'payment_status': paymentStatus,
      'created_on': createdOn.toIso8601String(),
    };
  }
}

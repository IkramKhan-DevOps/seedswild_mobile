import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';

class OrdersModel {
  final String orderId;
  final String orderDate;
  final String orderStatus;
  final String orderTotal;

  OrdersModel({
    required this.orderId,
    required this.orderDate,
    required this.orderStatus,
    required this.orderTotal,
  });
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrdersModel> orders = [
      OrdersModel(
          orderId: "1",
          orderDate: "25-12-23",
          orderStatus: "pending",
          orderTotal: "100"),
      OrdersModel(
          orderId: "2",
          orderDate: "26-12-23",
          orderStatus: "completed",
          orderTotal: "200"),
      OrdersModel(
          orderId: "3",
          orderDate: "27-12-23",
          orderStatus: "pending",
          orderTotal: "300"),
      OrdersModel(
          orderId: "4",
          orderDate: "28-12-23",
          orderStatus: "completed",
          orderTotal: "400"),
      OrdersModel(
          orderId: "5",
          orderDate: "29-12-23",
          orderStatus: "cancelled",
          orderTotal: "500"),
    ];

    return Scaffold(
      backgroundColor: SeedsColor.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Orders", style: TextStyle(color: Colors.white)),
        backgroundColor: SeedsColor.primary,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),

        // List of orders [order_id, order_date, order_status, order_total]
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            OrdersModel order = orders[index];
            status_icon() {
              if (order.orderStatus == "pending") {
                return Icon(Icons.pending, color: Colors.orange);
              } else if (order.orderStatus == "completed") {
                return Icon(Icons.check_circle, color: Colors.green);
              } else {
                return Icon(Icons.cancel, color: Colors.red);
              }
            }

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                tileColor: Colors.white,
                textColor: Colors.grey[700],
                iconColor: SeedsColor.primary,
                leading: Icon(Icons.shopping_bag, size: 30),
                title: Text(
                  "Order #${order.orderId}",
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Date: ${order.orderDate}',
                  style: GoogleFonts.aBeeZee(),
                ),
                trailing: status_icon(),
                onTap: ()=> Navigator.pushNamed(
                    context, AppRoutes.orderDetailScreen,
                    arguments: order.orderId
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

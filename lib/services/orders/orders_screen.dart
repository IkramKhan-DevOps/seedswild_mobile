import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/services/orders/providers/orders_provider.dart';

import 'models/orders_model.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var orders = context.read<OrdersProvider>().orders;
    print(orders);

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
              if (order.status == "pending") {
                return Icon(Icons.pending, color: Colors.orange);
              } else if (order.status == "completed") {
                return Icon(Icons.check_circle, color: Colors.green);
              } else {
                return Icon(Icons.cancel, color: Colors.red);
              }
            }

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[100]!),
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
                  'Date: ${order.createdOn}',
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

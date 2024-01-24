import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/services/orders/widgets/order_widgets.dart';
import 'package:seedswild/services/orders/widgets/sub_order_widgets.dart';

import '../../core/constants/colors.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  OrderDetailScreen({Key? key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Order# $orderId", style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        // sub_orders in orders
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // sub order 1
              SubOrderContainerWidget(),
              const SizedBox(height: 15),

              // sub order 2
              SubOrderContainerWidget(),
              const SizedBox(height: 15),

              // Overall Order Details
              OrderAmountsWidget(),
              const SizedBox(height: 15),

              OrderShipmentDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

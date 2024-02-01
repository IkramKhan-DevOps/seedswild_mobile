import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/services/orders/providers/order_detail_provider.dart';
import 'package:seedswild/services/orders/widgets/order_widgets.dart';
import 'package:seedswild/services/orders/widgets/sub_order_widgets.dart';

import '../../core/constants/colors.dart';
import '../../widgets/progress.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  OrderDetailScreen({Key? key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as String?;
    Provider.of<OrderDetailProvider>(context, listen: false)
        .orderDetailAPICall(context, int.parse(orderId!));

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
      body: FutureBuilder(
        future: Provider.of<OrderDetailProvider>(context, listen: false)
            .orderDetailAPICall(context, int.parse(orderId)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ProgressCircular();
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading user data"));
          } else {
            var order = context.watch<OrderDetailProvider>().orderDetail;
            var subOrders = order?.subOrders;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: subOrders?.length ?? 0,
                      itemBuilder: (context, index) {
                        var subOrder = subOrders?[index];
                        return SubOrderContainerWidget(
                          subOrder: subOrder,
                        );
                      },
                    ),

                    // amounts and shipments
                    const SizedBox(height: 15),
                    OrderAmountsWidget(
                      serviceCharges: order!.serviceCharges,
                      subTotal: order.subTotal,
                      total: order.total,
                    ),
                    const SizedBox(height: 15),
                    OrderShipmentDetailWidget(
                      fullName: order.fullName,
                      orderStatus: order.orderStatus,
                      paymentStatus: order.paymentStatus,
                      postalCode: order.postalCode,
                      contact: order.contact,
                      paymentType: order.paymentType,
                      address: order.address,
                      city: order.city,
                      state: order.state,
                      country: order.country.name,
                      createdOn: order.createdOn,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

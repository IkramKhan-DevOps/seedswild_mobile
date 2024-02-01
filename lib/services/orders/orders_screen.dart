import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/services/orders/providers/orders_provider.dart';

import '../../globals/utils/helpers.dart';
import '../../widgets/progress.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {


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
        child: FutureBuilder(
          future: Provider.of<OrdersProvider>(context, listen: false)
              .ordersAPICall(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProgressCircular();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading user data"));
            } else {

              var orders = Provider.of<OrdersProvider>(context).orders;

              // list of orders here <give me code fot this>
              return ListView.builder(
                itemCount: orders?.length ?? 0,
                itemBuilder: (context, index) {

                  final order = orders?[index];
                  return ListTile(
                    title: Text('ID: #${order?.id}'),
                    subtitle: Text('${order?.createdOn.day}/${order?.createdOn.month}/${order?.createdOn.year} ${order?.createdOn.hour}:${order?.createdOn.minute}'),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]
                        ),
                        child: Icon(Icons.shopping_bag_outlined)
                    ),
                    trailing: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          getIconForStatus(order!.orderStatus),
                          Text(order.orderStatus),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.orderDetailScreen,
                          arguments: order.id.toString(),
                      );
                    },
                  );
                },
              );

            }
          },
        ),
      ),
    );
  }
}

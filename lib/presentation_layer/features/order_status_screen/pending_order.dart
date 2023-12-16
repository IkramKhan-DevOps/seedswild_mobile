import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/pending_order_row.dart';
import 'package:flutter/material.dart';

class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  State<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

List listArr = [
  {
    "name": "Women's hoodie ",
    "order_id": "456789",
    "date": "2023-07-29 08:00",
    "payment_type": "Cash on Delivery",
    "price": "\$123",
    "image": "assets/products/5.png",
  },
  {
    "name": "Women's hoodie ",
    "order_id": "456789",
    "date": "2023-07-29 08:00",
    "payment_type": "Cash on Delivery",
    "price": "\$123",
    "image": "assets/products/5.png",
  },
  {
    "name": "Women's hoodie ",
    "order_id": "456789",
    "date": "2023-07-29 08:00",
    "payment_type": "Cash on Delivery",
    "price": "\$123",
    "image": "assets/products/5.png",
  },
  {
    "name": "Women's hoodie ",
    "order_id": "456789",
    "date": "2023-07-29 08:00",
    "payment_type": "Cash on Delivery",
    "price": "\$123",
    "image": "assets/products/5.png",
  }
];

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: listArr.length,
                  itemBuilder: (context, index) {
                    var pObj = listArr[index] as Map? ?? {};

                    return PendingOrderRow(
                      pObj: pObj,
                      onPressed: () {},
                    );
                  }),
            ),
            CustomButton(
                height: getVerticalSize(52),
                text: "Track your Order",
                margin: getMargin(top: 28),
                onTap: () {
                  // onTapWriteareview(context);
                })
          ],
        ),
      )),
    );
  }
}

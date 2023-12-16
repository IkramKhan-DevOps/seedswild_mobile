import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/utils/components/pending_order_row.dart';
import 'package:flutter/material.dart';

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({super.key});

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

List listArr = [
  {
    "name": "Women's hoodie ",
    "order_id": "456789",
    "date": "2023-07-29 08:00",
    "payment_type": "COMPLETED",
    "price": "\$123",
    "image": "assets/products/5.png",
  },
  {
    "name": "cape's hoodie ",
    "order_id": "3434334",
    "date": "2023-07-29 08:00",
    "payment_type": "COMPLETED",
    "price": "\$123",
    "image": "assets/products/3.jpg",
  },
  {
    "name": "Shirt's hoodie ",
    "order_id": "565656",
    "date": "2023-07-29 08:00",
    "payment_type": "COMPLETED",
    "price": "\$123",
    "image": "assets/products/2.jpg",
  },
  {
    "name": "Shirt's hoodie ",
    "order_id": "565656",
    "date": "2023-07-29 08:00",
    "payment_type": "COMPLETED",
    "price": "\$123",
    "image": "assets/products/2.jpg",
  },
];

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.white, // Adjust the background color as needed
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  title: Text("NIKE BRAND ORDER"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(ImageConstant.product5),
                  ),
                  children: [
                    SizedBox(
                      height: 650, // Adjust the height as needed
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listArr.length,
                        itemBuilder: (context, index) {
                          var pObj = listArr[index] as Map? ?? {};

                          return PendingOrderRow(
                            pObj: pObj,
                            onPressed: () {},
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';

import '../models/order_detail_model.dart';
import 'order_stepper.dart';

class SubOrderContainerWidget extends StatelessWidget {
  final SubOrder? subOrder;

  const SubOrderContainerWidget({super.key, this.subOrder});

  @override
  Widget build(BuildContext context) {

    List<OrderItem>? orderItems = subOrder?.orderItems;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),

      // main area
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        // columns
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              subOrder!.shop.shopName,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          // item1
          ListView.builder(
            itemCount: orderItems?.length ?? 0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              OrderItem? orderItem = orderItems?[0];
              return SubOrderTileWidget(
                categoryName: orderItem!.product.category.name,
                image: orderItem.product.thumbnailImage ?? "https://placehold.co/90/png?text=${orderItem.product.title[0]}",
                price: orderItem.product.price.toString(),
                quantity: orderItem.quantity.toString(),
                productName: orderItem.product.title,
              );
            },
          ),

          //shop details
          SubOrderStatusTileWidget(
            startDate: subOrder!.shipment.started?.toString() ?? "-",
            reachedDate: subOrder!.shipment.reached?.toString() ?? "-",
            status: subOrder!.shipment.shipmentStatus ?? "initialized",
            serviceName: subOrder!.shipment.provider ?? "-",
            trackingLink: subOrder!.shipment.trackingUrl ?? "-",
            trackingID: subOrder!.shipment.trackingId ?? "-",
            description: subOrder!.shipment.description ?? "-",
          ),
        ],
      ),
    );
  }
}

class SubOrderTileWidget extends StatelessWidget {
  final String productName;
  final String categoryName;
  final String image;
  final String quantity;
  final String price;

  const SubOrderTileWidget(
      {super.key,
      required this.productName,
      required this.categoryName,
      required this.image,
      required this.quantity,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 80,
              height: 80,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: SeedsColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  productName,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$quantity x $price\$",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SubOrderStatusTileWidget extends StatelessWidget {
  final String startDate;
  final String reachedDate;
  final String serviceName;
  final String trackingID;
  final String trackingLink;
  final String description;
  final String status;

  const SubOrderStatusTileWidget({
    super.key,
    required this.startDate,
    required this.reachedDate,
    required this.serviceName,
    required this.trackingID,
    required this.trackingLink,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // order status
          OrderStepperWidget(status: status),

          // shop name
          SubOrderRowWidget(leftText: "Created", rightText: startDate),
          SubOrderRowWidget(leftText: "Reached", rightText: reachedDate),

          // view more = on click open diaglog box()
          Container(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: SeedsColor.primary.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SubOrderShipmentDrawer(
                      description: description,
                      reachedDate: reachedDate,
                      startDate: startDate,
                      trackingID: trackingID,
                      trackingLink: trackingLink,
                      serviceName: serviceName,
                    );
                  },
                );
              },
              child: Text(
                "View More",
                style: GoogleFonts.aBeeZee(
                  color: SeedsColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubOrderRowWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const SubOrderRowWidget(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(leftText, style: GoogleFonts.aBeeZee()),
          Text(
            rightText,
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SubOrderShipmentDrawer extends StatelessWidget {
  final String? startDate;
  final String? reachedDate;
  final String? serviceName;
  final String? trackingID;
  final String? trackingLink;
  final String? description;

  const SubOrderShipmentDrawer({
    this.startDate,
    this.reachedDate,
    this.serviceName,
    this.trackingID,
    this.trackingLink,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                indent: 150,
                endIndent: 150,
                thickness: 3,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipment Details",
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      color: SeedsColor.primary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SubOrderRowWidget(
                      leftText: "created", rightText: "$startDate"),
                  SubOrderRowWidget(
                      leftText: "reached", rightText: "$reachedDate"),
                  SubOrderRowWidget(
                      leftText: "Service", rightText: "$serviceName"),
                  SubOrderRowWidget(
                      leftText: "Tracking ID", rightText: "$trackingID"),

                  // tracking link
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Tracking Link",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: SeedsColor.primary,
                          fontSize: 18,
                        ),
                      ),

                      // clickable link
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "$trackingLink",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // comments
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Comments",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: SeedsColor.primary,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "$description",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

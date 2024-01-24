import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';

import 'order_stepper.dart';

class SubOrderContainerWidget extends StatelessWidget {
  const SubOrderContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Shop Name",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          // item1
          SubOrderTileWidget(),
          SubOrderTileWidget(),

          //shop details
          SubOrderStatusTileWidget(
            created: "12th Jan, 2022",
            reached: "12th Jan, 2050",
            status: "delivery",
          ),
        ],
      ),
    );
  }
}

class SubOrderTileWidget extends StatelessWidget {
  const SubOrderTileWidget({super.key});

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
              "https://picsum.photos/80",
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
                  "category",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: SeedsColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Product Price",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "1 x 100\$",
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
  final String created;
  final String reached;
  final String status;

  const SubOrderStatusTileWidget(
      {super.key,
      required this.created,
      required this.reached,
      required this.status});

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
          SubOrderRowWidget(leftText: "Created", rightText: created),
          SubOrderRowWidget(leftText: "Reached", rightText: reached),

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
                    return SubOrderShipmentDrawer();
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
                      leftText: "created", rightText: "12th Jan, 2022"),
                  SubOrderRowWidget(
                      leftText: "Service", rightText: "DHL (fast)"),
                  SubOrderRowWidget(
                      leftText: "Tracking ID", rightText: "1234567890"),

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
                          "https://www.dhl.com/en/express/tracking.html?AWB=1234567890&brand=DHL",
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
                        "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit. Nulla euismod, nisl eget ultricies"
                        " ultrices, ni",
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

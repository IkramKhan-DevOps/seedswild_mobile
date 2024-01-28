import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderAmountsWidget extends StatelessWidget {
  const OrderAmountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        // columns
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Order Calculation",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          OrderRowWidget(leftText: "Subtotal", rightText: "100"),
          OrderRowWidget(leftText: "Shipping", rightText: "10"),
          OrderRowWidget(leftText: "Discount", rightText: "0"),
          OrderRowWidget(leftText: "Total", rightText: "110"),
        ],
      ),
    );
  }
}

class OrderShipmentDetailWidget extends StatelessWidget {
  const OrderShipmentDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        // columns
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Shipment Details",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          OrderRowWidget(leftText: "Name", rightText: "Mark I"),
          OrderRowWidget(leftText: "Payment Method", rightText: "Online"),

          Container(
            child: Text("some address, details, city, country", style: GoogleFonts.aBeeZee()),
          )
        ],
      ),
    );
  }
}

class OrderRowWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const OrderRowWidget({
    super.key, required this.leftText, required this.rightText
  });

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


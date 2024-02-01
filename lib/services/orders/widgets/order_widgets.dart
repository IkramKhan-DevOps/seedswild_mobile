import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/order_detail_model.dart';

class OrderAmountsWidget extends StatelessWidget {
  final double total;
  final double serviceCharges;
  final double subTotal;

  const OrderAmountsWidget({
    super.key,
    required this.total,
    required this.subTotal,
    required this.serviceCharges,
  });

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
          OrderRowWidget(leftText: "Subtotal", rightText: "$subTotal"),
          OrderRowWidget(leftText: "Service Charges", rightText: "$serviceCharges"),
          OrderRowWidget(leftText: "Total", rightText: "$total"),
        ],
      ),
    );
  }
}

class OrderShipmentDetailWidget extends StatelessWidget {

  final String fullName;
  final String contact;
  final String postalCode;
  final String address;
  final String city;
  final String state;
  final String country;
  final String paymentType;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdOn;

  const OrderShipmentDetailWidget({
    super.key,
    required this.fullName,
    required this.contact,
    required this.postalCode,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.paymentType,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdOn
  });

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
          OrderRowWidget(leftText: "Name", rightText: fullName),
          OrderRowWidget(leftText: "Payment Method", rightText: paymentType),

          Container(
            child: Text("$address $city $country", style: GoogleFonts.aBeeZee()),
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


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';

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
          // item1
          SubOrderTileWidget(),
          SubOrderTileWidget(),

          //shop details
          SubOrderStatusTileWidget(),
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
  const SubOrderStatusTileWidget({super.key});

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
          // shop name
          SubOrderRowWidget(leftText: "Shop Name", rightText: "..................."),
          SubOrderRowWidget(leftText: "Status", rightText: "Completed"),
          SubOrderRowWidget(leftText: "Date", rightText: "12 Jan, 2024"),
        ],
      ),
    );
  }
}

class SubOrderRowWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const SubOrderRowWidget({
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

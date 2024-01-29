import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/widgets/buttons.dart';

import '../../core/constants/colors.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SeedsColor.background,
      resizeToAvoidBottomInset: false,

      //app bar
      appBar: AppBar(
        title: Text("Subscriptions", style: TextStyle(color: Colors.white)),
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

      //body
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // subscription row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Package",
                        style: GoogleFonts.aBeeZee(),
                      ),
                      Text(
                        "Premium",
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: GoogleFonts.aBeeZee(),
                      ),
                      Text(
                        "100\$/month",
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dated",
                        style: GoogleFonts.aBeeZee(),
                      ),
                      Text(
                        "2nd January, 2024",
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            SeedsElevatedButton(
              title: "more details",
              icon: Icons.expand_circle_down,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

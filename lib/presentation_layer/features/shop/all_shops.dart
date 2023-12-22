import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../home_page/widgets/product widget/roundedImage.dart';

class AllShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(45),
          leadingWidth: 56,
          leading: AppbarImage(
              height: getSize(40),
              width: getSize(40),
              imagePath: ImageConstant.backArrow,
              margin: getMargin(left: 16),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.shopScreen);
              }),
          centerTitle: true,
          title: Text("ALL SHOPS",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium18Black900),
        ),
        body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return shopWidget();
          },
        ));
  }
}

class shopWidget extends StatelessWidget {
  const shopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        margin: EdgeInsets.all(12),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Icon(
                    Icons.map,
                    // color: ColorConstant.golden,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Address: 1418 Riverwood Drive,',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                child: ListTile(
                  title: Text(
                    "KHADI SHOP",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  subtitle: RatingBar.builder(
                      initialRating: 4,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: getVerticalSize(16),
                      unratedColor: ColorConstant.amber500,
                      itemCount: 5,
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {},
                      itemBuilder: (context, _) {
                        return Icon(Icons.star, color: ColorConstant.amber500);
                      }),
                  trailing: RoundedImage(
                    height: 320,
                    width: 100,
                    imagePath: ImageConstant.brandNike,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      // backgroundColor:
                      //     MaterialStateProperty.all(ColorConstant.golden),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            6), // Set radius to 0 for no border radius
                      )),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.subShop);
                    },
                    child: Text(
                      "231 Products",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      // backgroundColor:
                      //     MaterialStateProperty.all(ColorConstant.golden),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            6), // Set radius to 0 for no border radius
                      )),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.subShop);
                    },
                    child: Text(
                      "Visit Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

onTapVisitShop(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.subShop);
}

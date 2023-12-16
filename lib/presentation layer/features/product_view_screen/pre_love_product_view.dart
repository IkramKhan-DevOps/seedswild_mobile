import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';

class PreLovedViewScreen extends StatelessWidget {
  onTapTxtSeeAll(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reviewsTabContainerScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  height: getVerticalSize(700),
                                  width: double.maxFinite,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.watch,
                                            height: getVerticalSize(451),
                                            width: getHorizontalSize(375),
                                            alignment: Alignment.topCenter),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 10,
                                                    right: 16,
                                                    bottom: 26),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL30),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text(
                                                              "Order Status",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsMedium20)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text("Reviews",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsMedium20),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      onTapReview(
                                                                          context);
                                                                    },
                                                                    child: Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                4),
                                                                        child: Text(
                                                                            "See All",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtPoppinsMedium14MainGreenColor)))
                                                              ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 14),
                                                          child: Row(children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgStar6,
                                                                height:
                                                                    getSize(24),
                                                                width:
                                                                    getSize(24),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            1))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            4),
                                                                child: Text(
                                                                    "4.8(1,024 reviews)",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsSemiBold16Gray500
                                                                        .copyWith(
                                                                            letterSpacing:
                                                                                getHorizontalSize(1.28))))
                                                          ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 29,
                                                              right: 9,
                                                              bottom: 15),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        top: 12,
                                                                        bottom:
                                                                            11),
                                                                    child: RichText(
                                                                        text: TextSpan(children: [
                                                                          TextSpan(
                                                                              text: "\$",
                                                                              style: TextStyle(color: ColorConstant.mainGreenColor, fontSize: getFontSize(22), fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                                                                          TextSpan(
                                                                              text: " 134.98",
                                                                              style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(22), fontFamily: 'Poppins', fontWeight: FontWeight.w600))
                                                                        ]),
                                                                        textAlign: TextAlign.left)),
                                                                CustomButton(
                                                                    onTap: () {
                                                                      onTapCart(
                                                                          context);
                                                                    },
                                                                    height:
                                                                        getVerticalSize(
                                                                            57),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            173),
                                                                    text:
                                                                        "Add To Cart")
                                                              ]))
                                                    ])))
                                      ]))))
                    ]))));
  }
}

onTapCart(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.myCartPage);
}

onTapReview(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.tabReviewScreen);
}

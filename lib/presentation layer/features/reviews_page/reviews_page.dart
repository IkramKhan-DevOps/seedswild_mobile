import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../reviews_page/widgets/listdatatype_item_widget.dart';
import '../reviews_page/widgets/listrating_item_widget.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
  onTapWriteareview(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.writeAReviewScreen);
  }
}

class _ReviewsPageState extends State<ReviewsPage>
    with AutomaticKeepAliveClientMixin<ReviewsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Padding(
                          padding: getPadding(left: 16, top: 19, right: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("4.8",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsSemiBold30
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(2.4))),
                                Padding(
                                    padding: getPadding(top: 8),
                                    child: RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemSize: getVerticalSize(20),
                                        unratedColor: ColorConstant.amber500,
                                        itemCount: 5,
                                        updateOnDrag: true,
                                        onRatingUpdate: (rating) {},
                                        itemBuilder: (context, _) {
                                          return Icon(Icons.star,
                                              color: ColorConstant.amber500);
                                        })),
                                Padding(
                                    padding: getPadding(top: 10),
                                    child: Text("Based on 1,024 reviews",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular14Gray500)),
                                Padding(
                                    padding: getPadding(top: 8),
                                    child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(6));
                                        },
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return ListratingItemWidget();
                                        })),
                                Padding(
                                    padding: getPadding(top: 8),
                                    child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(5));
                                        },
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return ListdatatypeItemWidget();
                                        })),
                                Padding(
                                    padding: getPadding(top: 27),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse533x331,
                                              height: getSize(33),
                                              width: getSize(33),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(16)),
                                              margin: getMargin(top: 3)),
                                          Padding(
                                              padding: getPadding(left: 8),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Ariana Peter",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular14Black900),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child:
                                                            RatingBar.builder(
                                                                initialRating:
                                                                    4,
                                                                minRating: 0,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    false,
                                                                itemSize:
                                                                    getVerticalSize(
                                                                        14),
                                                                unratedColor:
                                                                    ColorConstant
                                                                        .amber500,
                                                                itemCount: 5,
                                                                updateOnDrag:
                                                                    true,
                                                                onRatingUpdate:
                                                                    (rating) {},
                                                                itemBuilder:
                                                                    (context,
                                                                        _) {
                                                                  return Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: ColorConstant
                                                                          .amber500);
                                                                }))
                                                  ])),
                                          Spacer(),
                                          Padding(
                                              padding:
                                                  getPadding(top: 7, bottom: 7),
                                              child: Text("1 Day ago",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Gray500
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  1.12))))
                                        ])),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        width: getHorizontalSize(291),
                                        margin: getMargin(
                                            left: 41, top: 12, right: 11),
                                        child: Text(
                                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtInterRegular14))),
                                Padding(
                                    padding: getPadding(top: 23),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse533x332,
                                              height: getSize(33),
                                              width: getSize(33),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(16)),
                                              margin: getMargin(top: 1)),
                                          Padding(
                                              padding: getPadding(left: 8),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Nancy Wheeler",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular14Black900),
                                                    RatingBar.builder(
                                                        initialRating: 4,
                                                        minRating: 0,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: false,
                                                        itemSize:
                                                            getVerticalSize(14),
                                                        unratedColor:
                                                            ColorConstant
                                                                .amber500,
                                                        itemCount: 5,
                                                        updateOnDrag: true,
                                                        onRatingUpdate:
                                                            (rating) {},
                                                        itemBuilder:
                                                            (context, _) {
                                                          return Icon(
                                                              Icons.star,
                                                              color:
                                                                  ColorConstant
                                                                      .amber500);
                                                        })
                                                  ])),
                                          Spacer(),
                                          Padding(
                                              padding:
                                                  getPadding(top: 5, bottom: 7),
                                              child: Text("1 Day ago",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Gray500
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  1.12))))
                                        ])),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        width: getHorizontalSize(291),
                                        margin: getMargin(
                                            left: 41, top: 12, right: 11),
                                        child: Text(
                                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtInterRegular14))),
                                CustomButton(
                                    height: getVerticalSize(52),
                                    text: "Write a Review",
                                    margin: getMargin(top: 28),
                                    onTap: () {
                                      onTapWriteareview(context);
                                    })
                              ]))
                    ])))));
  }

  onTapWriteareview(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.writeAReviewScreen);
  }
}

class TabContainerScreen extends StatefulWidget {
  @override
  _TabContainerScreenState createState() => _TabContainerScreenState();
  onTapArrowleft13(BuildContext context) {
    Navigator.pop(context);
  }
}

// ignore_for_file: must_be_immutable
class _TabContainerScreenState extends State<TabContainerScreen>
    with TickerProviderStateMixin {
  late TabController group18Controller;

  @override
  void initState() {
    super.initState();
    group18Controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 5, bottom: 5),
                    onTap: () {
                      onTapArrowleft13(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Reviews")),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(52),
                          width: getHorizontalSize(343),
                          margin: getMargin(top: 24),
                          decoration: BoxDecoration(
                              color: ColorConstant.gray200,
                              borderRadius:
                                  BorderRadius.circular(getHorizontalSize(10))),
                          child: TabBar(
                            controller: group18Controller,
                            labelColor: ColorConstant.mainGreenColor,
                            labelStyle: TextStyle(
                              fontSize: getFontSize(16),
                              fontFamily: 'Poppins',
                            ),
                            unselectedLabelColor: ColorConstant.black900,
                            unselectedLabelStyle: TextStyle(
                              fontSize: getFontSize(16),
                              fontFamily: 'Poppins',
                            ),
                            indicator: BoxDecoration(
                                // color: ColorConstant.mainGreenColor,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(10))),
                            labelPadding: EdgeInsets.all(12.0),
                            tabs: [
                              Text("Positive ",
                                  overflow: TextOverflow.ellipsis),
                              Text("Negative ",
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                      Container(
                          height: getVerticalSize(642),
                          child: TabBarView(
                              controller: group18Controller,
                              children: [
                                ReviewsPage(),
                                ReviewsPage(),
                              ])),
                    ]))));
  }

  onTapArrowleft13(BuildContext context) {
    Navigator.pop(context);
  }
}

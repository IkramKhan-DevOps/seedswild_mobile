import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/presentation%20layer/features/order_status_screen/complete_order.dart';
import 'package:annafi_app/presentation%20layer/features/order_status_screen/pending_order.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ReviewsTabContainerScreen extends StatefulWidget {
  @override
  _ReviewsTabContainerScreenState createState() =>
      _ReviewsTabContainerScreenState();
  onTapArrowleft13(BuildContext context) {
    Navigator.pop(context);
  }
}

// ignore_for_file: must_be_immutable
class _ReviewsTabContainerScreenState extends State<ReviewsTabContainerScreen>
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
                title: AppbarSubtitle(text: " My Orders ")),
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
                              Text("Pending Order",
                                  overflow: TextOverflow.ellipsis),
                              Text("Completed Order",
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                      Container(
                          height: getVerticalSize(642),
                          child: TabBarView(
                              controller: group18Controller,
                              children: [
                                PendingOrderScreen(),
                                CompleteOrderScreen(),
                              ])),
                    ]))));
  }

  onTapArrowleft13(BuildContext context) {
    Navigator.pop(context);
  }
}

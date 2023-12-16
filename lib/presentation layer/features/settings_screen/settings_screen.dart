// ignore_for_file: sized_box_for_whitespace

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'statemanagement/theme_changer.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

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
                      onTapArrowleft15(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(
                  text: "Settings",
                )),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTapProfile(context);
                        },
                        child: Container(
                            padding: getPadding(
                                left: 16, top: 14, right: 16, bottom: 14),
                            decoration: AppDecoration.fillGray10001.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder12),
                            child: Row(children: [
                              Container(
                                  height: getSize(64),
                                  width: getSize(64),
                                  margin: getMargin(top: 1),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse45,
                                            height: getSize(48),
                                            width: getSize(48),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(24)),
                                            alignment: Alignment.center),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getSize(64),
                                                width: getSize(64),
                                                child:
                                                    CircularProgressIndicator(
                                                        color: ColorConstant
                                                            .mainGreenColor,
                                                        value: 0.5)))
                                      ])),
                              Padding(
                                  padding:
                                      getPadding(left: 22, top: 6, bottom: 8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Anne Christion",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsRegular18Black900),
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Text("Premium User",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular14Gray500))
                                      ])),
                              const Spacer(),
                              CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightBlack900,
                                  height: getSize(16),
                                  width: getSize(16),
                                  margin: getMargin(top: 24, bottom: 25))
                            ])),
                      ),
                      Padding(
                          padding: getPadding(top: 27),
                          child: Text("Settings",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium18Black900)),
                      GestureDetector(
                          onTap: () {
                            onTapNotification(context);
                          },
                          child: Container(
                              margin: getMargin(top: 9),
                              padding: getPadding(
                                  left: 16, top: 14, right: 16, bottom: 14),
                              decoration: AppDecoration.fillGray10001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgNotification24x24,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(top: 1)),
                                Padding(
                                    padding: getPadding(left: 24),
                                    child: Text("Notifications",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular16)),
                                const Spacer(),
                                CustomSwitch(
                                    margin: getMargin(top: 5, bottom: 4),
                                    value: isSelectedSwitch,
                                    onChanged: (value) {
                                      isSelectedSwitch = value;
                                    })
                              ]))),
                      GestureDetector(
                          onTap: () {
                            onTapRowclock(context);
                          },
                          child: Container(
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 16, top: 14, right: 16, bottom: 14),
                              decoration: AppDecoration.fillGray10001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgClock24x24,
                                        height: getSize(24),
                                        width: getSize(24),
                                        margin: getMargin(bottom: 1)),
                                    Padding(
                                        padding: getPadding(left: 24),
                                        child: Text("My Orders",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtPoppinsRegular16)),
                                    const Spacer(),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowrightBlack900,
                                        height: getSize(16),
                                        width: getSize(16),
                                        margin: getMargin(top: 4, bottom: 5))
                                  ]))),
                      Container(
                          margin: getMargin(top: 15),
                          padding: getPadding(
                              left: 16, top: 12, right: 16, bottom: 12),
                          decoration: AppDecoration.fillGray10001.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgMinimize,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(top: 1, bottom: 2)),
                                Padding(
                                    padding: getPadding(left: 24, top: 4),
                                    child: Text("Language",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular16)),
                                const Spacer(),
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightBlack900,
                                    height: getSize(16),
                                    width: getSize(16),
                                    margin: getMargin(top: 5, bottom: 6))
                              ])),
                      Container(
                          margin: getMargin(top: 15, bottom: 5),
                          padding: getPadding(
                              left: 16, top: 13, right: 16, bottom: 13),
                          decoration: AppDecoration.fillGray10001.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgComputer24x24,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1)),
                                Padding(
                                    padding: getPadding(left: 24, top: 1),
                                    child: Text("FAQs",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular16)),
                                const Spacer(),
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightBlack900,
                                    height: getSize(16),
                                    width: getSize(16),
                                    margin: getMargin(top: 4, bottom: 5))
                              ]))
                    ]))));
  }

  onTapNotification(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  onTapProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilePage);
  }

  onTapTrackingOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.trackingOrderScreen);
  }

  onTapRowclock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reviewsTabContainerScreen);
  }

  onTapArrowleft15(BuildContext context) {
    Navigator.pop(context);
  }
}

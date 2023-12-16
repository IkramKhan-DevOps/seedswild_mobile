import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation%20layer/features/logout_bottomsheet/logout_bottomsheet.dart';
import 'package:annafi_app/presentation%20layer/features/user_session/statemanagement/user_provider.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Container(
                                height: getVerticalSize(226),
                                width: double.maxFinite,
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              padding: getPadding(
                                                  left: 159,
                                                  top: 11,
                                                  right: 159,
                                                  bottom: 11),
                                              decoration: AppDecoration
                                                  .fillBlack900
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .customBorderBL25),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            bottom: 84),
                                                        child: Text("Profile",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium18WhiteA700))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 115, right: 115),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        height: getVerticalSize(
                                                            104),
                                                        width:
                                                            getHorizontalSize(
                                                                92),
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgEllipse592x92,
                                                                  height:
                                                                      getSize(
                                                                          92),
                                                                  width:
                                                                      getSize(
                                                                          92),
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          getHorizontalSize(
                                                                              46)),
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter),
                                                              CustomIconButton(
                                                                  height: 30,
                                                                  width: 30,
                                                                  variant:
                                                                      IconButtonVariant
                                                                          .OutlineWhiteA700,
                                                                  padding:
                                                                      IconButtonPadding
                                                                          .PaddingAll6,
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  child: CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgCamera))
                                                            ])),
                                                    Text("Anne Christion",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsMedium20),
                                                    Text("xyz@gmail.com",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular127)
                                                  ])))
                                    ])),
                            InkWell(
                              onTap: () {
                                onTapInfo(context);
                              },
                              child: Container(
                                  margin:
                                      getMargin(left: 16, top: 23, right: 16),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.fillGray10001
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgUser24x24,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin: getMargin(bottom: 1)),
                                        Padding(
                                            padding: getPadding(left: 24),
                                            child: Text("Personal Data",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular16)),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightBlack900,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin:
                                                getMargin(top: 4, bottom: 5))
                                      ])),
                            ),
                            Container(
                                margin: getMargin(left: 16, top: 15, right: 16),
                                padding: getPadding(
                                    left: 16, top: 12, right: 16, bottom: 12),
                                decoration: AppDecoration.fillGray10001
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgSave,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(top: 2, bottom: 1)),
                                      Padding(
                                          padding: getPadding(left: 24, top: 4),
                                          child: Text("Transaction History",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular16)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlack900,
                                          height: getSize(16),
                                          width: getSize(16),
                                          margin: getMargin(top: 5, bottom: 6))
                                    ])),
                            GestureDetector(
                                onTap: () {
                                  onTapRowcar(context);
                                },
                                child: Container(
                                    margin:
                                        getMargin(left: 16, top: 15, right: 16),
                                    padding: getPadding(
                                        left: 16,
                                        top: 14,
                                        right: 16,
                                        bottom: 14),
                                    decoration: AppDecoration.fillGray10001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgCar,
                                              height: getSize(24),
                                              width: getSize(24),
                                              margin: getMargin(top: 1)),
                                          Padding(
                                              padding: getPadding(left: 24),
                                              child: Text("Discount Code",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular16)),
                                          Spacer(),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightBlack900,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin:
                                                  getMargin(top: 4, bottom: 5))
                                        ]))),
                            InkWell(
                              onTap: () {
                                onTapSetting(context);
                              },
                              child: Container(
                                  margin:
                                      getMargin(left: 16, top: 15, right: 16),
                                  padding: getPadding(
                                      left: 16, top: 12, right: 16, bottom: 12),
                                  decoration: AppDecoration.fillGray10001
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgSettings24x24,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin:
                                                getMargin(top: 1, bottom: 2)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 3),
                                            child: Text("Settings",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular16)),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightBlack900,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin:
                                                getMargin(top: 5, bottom: 6))
                                      ])),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  userProvider.removeToken().then((value) {
                                    onTapLogout(context);
                                  });
                                },
                                child: Container(
                                    margin: getMargin(
                                        left: 16, right: 16, bottom: 37),
                                    padding: getPadding(
                                        left: 120,
                                        top: 11,
                                        right: 120,
                                        bottom: 11),
                                    decoration: AppDecoration.fillBlack900
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: getSize(24),
                                              width: getSize(24),
                                              margin:
                                                  getMargin(top: 2, bottom: 2)),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("Logout",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular16WhiteA700))
                                        ])))
                          ]))
                    ]))));
  }

  onTapRowcar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.discountItemsScreen);
  }

  onTapInfo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.informationScreen);
  }

  onTapSetting(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }

  onTapLogout(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => LogoutBottomsheet(),
        isScrollControlled: true);
  }
}

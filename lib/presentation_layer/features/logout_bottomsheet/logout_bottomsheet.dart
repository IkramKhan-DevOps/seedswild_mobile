import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:flutter/material.dart';

class LogoutBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 40, right: 16, bottom: 40),
                decoration: AppDecoration.fillWhiteA700
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: getPadding(top: 2),
                          child: Text("Alert",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium25)),
                      Container(
                          width: getHorizontalSize(189),
                          margin: getMargin(top: 7),
                          child: Text(
                              "Do you want to\nlog out of the application",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsRegular15)),
                      Padding(
                          padding: getPadding(top: 47),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    height: getVerticalSize(52),
                                    width: getHorizontalSize(164),
                                    text: "Yes",
                                    onTap: () {
                                      onTapYes(context);
                                    }),
                                CustomButton(
                                    height: getVerticalSize(52),
                                    width: getHorizontalSize(163),
                                    text: "No",
                                    variant: ButtonVariant.FillGray200,
                                    fontStyle: ButtonFontStyle
                                        .PoppinsMedium16Black900_1,
                                    onTap: () {
                                      Navigator.pop(context);
                                    })
                              ]))
                    ]))));
  }

  onTapYes(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}

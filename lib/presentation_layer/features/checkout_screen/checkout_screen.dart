import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../checkout_screen/widgets/checkout_item_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft10(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Checkout")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 20, right: 16, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Delivery Address",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium18Black900),
                      Padding(
                          padding: getPadding(top: 15),
                          child: Row(children: [
                            CustomIconButton(
                                height: 42,
                                width: 42,
                                margin: getMargin(bottom: 2),
                                variant: IconButtonVariant.OutlineGray10001_1,
                                padding: IconButtonPadding.PaddingAll9,
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgLocation42x42)),
                            Padding(
                                padding: getPadding(left: 12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Address",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular14Black900),
                                      Padding(
                                          padding: getPadding(top: 2),
                                          child: Text("KPK, PAKISTAN",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular14Orange700))
                                    ]))
                          ])),
                      Padding(
                          padding: getPadding(top: 29),
                          child: Text("Payment Mathod",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium18Black900)),
                      Padding(
                          padding: getPadding(top: 9),
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(8));
                              },
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const CheckoutItemWidget();
                              })),
                      Padding(
                          padding: getPadding(top: 54),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium17),
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "",
                                          style: TextStyle(
                                              color: ColorConstant.orange700,
                                              fontSize: getFontSize(17),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: " 144.94",
                                          style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(17),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600))
                                    ]),
                                    textAlign: TextAlign.left)
                              ])),
                      CustomButton(
                          height: getVerticalSize(52),
                          text: "Pay Now",
                          margin: getMargin(top: 24, bottom: 5),
                          onTap: () {
                            onTapPaynow(context);
                          })
                    ]))));
  }

  onTapPaynow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.completeScreen);
  }

  onTapArrowleft10(BuildContext context) {
    Navigator.pop(context);
  }
}

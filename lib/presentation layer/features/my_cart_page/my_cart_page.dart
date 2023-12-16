import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';

import '../my_cart_page/widgets/mycart_item_widget.dart';

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(45),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16),
                    onTap: () {
                      onTapArrowleft9(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "My Cart"),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgBag,
                      margin: getMargin(left: 16, top: 8, right: 16, bottom: 8))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 16, top: 23, right: 16, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Promo Code or Vourchers",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular20),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowrightBlack900,
                                        height: getSize(16),
                                        width: getSize(16),
                                        margin: getMargin(top: 7, bottom: 6))
                                  ]),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(14));
                                      },
                                      itemCount: 2,
                                      itemBuilder: (context, index) {
                                        return MycartItemWidget();
                                      })),
                              Padding(
                                  padding: getPadding(top: 31),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtPoppinsRegular17),
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .orange700,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: " 134.94",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 7),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Fee & Delivery",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtPoppinsRegular17),
                                        Padding(
                                            padding: getPadding(bottom: 2),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .orange700,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: " 10",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 4),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsMedium17),
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .orange700,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: " 144.94",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                              CustomButton(
                                  height: getVerticalSize(52),
                                  text: "Checkout",
                                  margin: getMargin(top: 35),
                                  onTap: () {
                                    onTapCheckout(context);
                                  })
                            ]))))));
  }

  onTapCheckout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.checkoutScreen);
  }

  onTapArrowleft9(BuildContext context) {
    Navigator.pop(context);
  }
}

import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/presentation_layer/features/orders/widgets/checkout_item_widget.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
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

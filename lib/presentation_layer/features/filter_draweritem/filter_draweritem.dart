import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterDraweritem extends StatelessWidget {
  final TextEditingController group848Controller = TextEditingController();

  final TextEditingController group847Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: getHorizontalSize(700),
          padding: getPadding(left: 3, right: 3, bottom: 3),
          decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                    indent: 150,
                    endIndent: 150,
                    thickness: 6,
                    color: ColorConstant.mainGreenColor),
                Padding(
                    padding: getPadding(left: 13, top: 2),
                    child: Text(
                      "Category",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular16,
                    )),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            height: getVerticalSize(31),
                            width: getHorizontalSize(83),
                            text: "Shirts",
                            variant: ButtonVariant.FillGray10001,
                            shape: ButtonShape.RoundedBorder7,
                            padding: ButtonPadding.PaddingAll4,
                            fontStyle: ButtonFontStyle.PoppinsRegular14Gray500,
                          ),
                          CustomButton(
                            margin: getMargin(left: 10),
                            height: getVerticalSize(31),
                            width: getHorizontalSize(83),
                            text: "Pants",
                            variant: ButtonVariant.FillGray10001,
                            shape: ButtonShape.RoundedBorder7,
                            padding: ButtonPadding.PaddingAll4,
                            fontStyle: ButtonFontStyle.PoppinsRegular14Gray500,
                          ),
                          CustomButton(
                            height: getVerticalSize(31),
                            width: getHorizontalSize(94),
                            text: "Jeans",
                            margin: getMargin(left: 10),
                            variant: ButtonVariant.FillGray10001,
                            shape: ButtonShape.RoundedBorder7,
                            padding: ButtonPadding.PaddingAll4,
                            fontStyle: ButtonFontStyle.PoppinsRegular14Gray500,
                          ),
                          Container(
                            width: getHorizontalSize(75),
                            margin: getMargin(left: 10),
                            padding: getPadding(
                                left: 12, top: 2, right: 12, bottom: 2),
                            child: Text(
                              "Imagic",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular14Gray500,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomButton(
                              height: getVerticalSize(31),
                              width: getHorizontalSize(83),
                              text: "Consilor",
                              margin: getMargin(left: 13, top: 4),
                              variant: ButtonVariant.FillGray10001,
                              shape: ButtonShape.RoundedBorder7,
                              padding: ButtonPadding.PaddingAll4,
                              fontStyle:
                                  ButtonFontStyle.PoppinsRegular14Gray500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(top: 5),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray10001,
                            indent: getHorizontalSize(13),
                            endIndent: getHorizontalSize(12)))),
                Padding(
                    padding: getPadding(left: 13, top: 5),
                    child: Text("Discounts",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular16)),
                Padding(
                    padding: getPadding(left: 0, top: 6, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                              height: getVerticalSize(31),
                              width: getHorizontalSize(80),
                              text: "5%-20%",
                              variant: ButtonVariant.FillGray10001,
                              shape: ButtonShape.RoundedBorder7,
                              padding: ButtonPadding.PaddingAll4,
                              fontStyle:
                                  ButtonFontStyle.PoppinsRegular14Gray500),
                          CustomButton(
                              height: getVerticalSize(31),
                              width: getHorizontalSize(80),
                              text: "20%-40%",
                              margin: getMargin(left: 10),
                              variant: ButtonVariant.FillGray10001,
                              shape: ButtonShape.RoundedBorder7,
                              padding: ButtonPadding.PaddingAll4,
                              fontStyle:
                                  ButtonFontStyle.PoppinsRegular14Gray500),
                          CustomButton(
                              height: getVerticalSize(31),
                              width: getHorizontalSize(80),
                              margin: getMargin(left: 10),
                              text: "40 %-60%",
                              variant: ButtonVariant.FillGray10001,
                              shape: ButtonShape.RoundedBorder7,
                              padding: ButtonPadding.PaddingAll4,
                              fontStyle:
                                  ButtonFontStyle.PoppinsRegular14Gray500),
                        ])),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(top: 6),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray10001,
                            indent: getHorizontalSize(13),
                            endIndent: getHorizontalSize(12)))),
                Padding(
                    padding: getPadding(left: 13, top: 6),
                    child: Text("Price",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular16)),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(left: 13, top: 12, right: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextFormField(
                                  width: getHorizontalSize(108),
                                  focusNode: FocusNode(),
                                  controller: group848Controller,
                                  hintText: "Min",
                                  variant:
                                      TextFormFieldVariant.OutlineGray20004,
                                  shape: TextFormFieldShape.RoundedBorder5,
                                  padding: TextFormFieldPadding.PaddingAll4,
                                  fontStyle: TextFormFieldFontStyle
                                      .PoppinsRegular14Gray500),
                              Padding(
                                  padding: getPadding(top: 3, bottom: 3),
                                  child: Text("-",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular16)),
                              CustomTextFormField(
                                  width: getHorizontalSize(108),
                                  focusNode: FocusNode(),
                                  controller: group847Controller,
                                  hintText: "Max",
                                  variant:
                                      TextFormFieldVariant.OutlineGray20004,
                                  shape: TextFormFieldShape.RoundedBorder5,
                                  padding: TextFormFieldPadding.PaddingAll4,
                                  fontStyle: TextFormFieldFontStyle
                                      .PoppinsRegular14Gray500,
                                  textInputAction: TextInputAction.done)
                            ]))),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(top: 20),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray10001,
                            indent: getHorizontalSize(13),
                            endIndent: getHorizontalSize(12)))),
                Padding(
                    padding: getPadding(left: 13, top: 18),
                    child: Text("Rating",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular16)),
                Padding(
                    padding: getPadding(left: 11, top: 7),
                    child: RatingBar.builder(
                        initialRating: 5,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemSize: getVerticalSize(22),
                        itemCount: 5,
                        updateOnDrag: true,
                        onRatingUpdate: (rating) {},
                        itemBuilder: (context, _) {
                          return Icon(Icons.star,
                              color: ColorConstant.orange700);
                        })),
                Padding(
                    padding: getPadding(top: 14),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              height: getVerticalSize(53),
                              width: getHorizontalSize(140),
                              text: "Reset",
                              variant: ButtonVariant.FillGray200,
                              shape: ButtonShape.Square,
                              fontStyle:
                                  ButtonFontStyle.PoppinsMedium15Black900),
                          CustomButton(
                              height: getVerticalSize(53),
                              width: getHorizontalSize(140),
                              text: "Complete",
                              shape: ButtonShape.Square,
                              fontStyle:
                                  ButtonFontStyle.PoppinsMedium15WhiteA700_1,
                              onTap: () {
                                onTapComplete(context);
                              })
                        ]))
              ])),
    );
  }

  onTapComplete(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productsScreen);
  }
}

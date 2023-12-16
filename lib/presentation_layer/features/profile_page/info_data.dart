import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class InformationScreen extends StatelessWidget {
  TextEditingController groupController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController groupOneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 5, bottom: 5),
                    onTap: () {
                      onTapArrowleft4(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Information")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(104),
                              width: getHorizontalSize(92),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEllipse591x92,
                                        height: getVerticalSize(91),
                                        width: getHorizontalSize(92),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(46)),
                                        alignment: Alignment.topCenter),
                                    CustomIconButton(
                                        height: 29,
                                        width: 30,
                                        variant:
                                            IconButtonVariant.OutlineWhiteA700,
                                        padding: IconButtonPadding.PaddingAll6,
                                        alignment: Alignment.bottomCenter,
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgCamera))
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Anne Christion",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium20)),
                      Align(
                          alignment: Alignment.center,
                          child: Text("xyz@gmail.com",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular127)),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Text("Account Name",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium15)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: groupController,
                          hintText: "Anne Christion",
                          margin: getMargin(top: 10)),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Text("Date of Birth",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium15)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: dateController,
                          hintText: "11-01-1997",
                          margin: getMargin(top: 11)),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Text("Address",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium15)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: countryController,
                          hintText: "New south Wales, Australia",
                          margin: getMargin(top: 10)),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Text("Mobile Number",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium15)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: groupOneController,
                          hintText: "9999 999 999",
                          margin: getMargin(top: 11, bottom: 3),
                          textInputAction: TextInputAction.done)
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(52),
                text: "Complete",
                margin: getMargin(left: 16, right: 16, bottom: 50),
                onTap: () {
                  onTapComplete(context);
                })));
  }

  onTapComplete(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilePage);
  }

  onTapArrowleft4(BuildContext context) {
    Navigator.pop(context);
  }
}

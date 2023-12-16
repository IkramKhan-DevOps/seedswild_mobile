import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController group964Controller = TextEditingController();

  TextEditingController group965Controller = TextEditingController();

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
                      onTapArrowleft7(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Reset Password")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 28, right: 16, bottom: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 9),
                          child: Text("Enter a new password",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular16)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: group964Controller,
                          hintText: "New Password",
                          margin: getMargin(top: 49),
                          padding: TextFormFieldPadding.PaddingT14,
                          textInputType: TextInputType.visiblePassword,
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 18, right: 16, bottom: 18),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLocation)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          isObscureText: true),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: group965Controller,
                          hintText: "Confirm Password",
                          margin: getMargin(top: 20),
                          padding: TextFormFieldPadding.PaddingT14,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 18, right: 16, bottom: 18),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLocation)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          isObscureText: true),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(52),
                          text: "Confirm",
                          margin: getMargin(bottom: 310),
                          onTap: () {
                            onTapConfirm(context);
                          })
                    ]))));
  }

  onTapConfirm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }

  onTapArrowleft7(BuildContext context) {
    Navigator.pop(context);
  }
}

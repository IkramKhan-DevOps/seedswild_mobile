import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController group1003Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(55),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 5, bottom: 5),
                    onTap: () {
                      onTapArrowleft5(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Forgot Password")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 27, right: 16, bottom: 27),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(310),
                          margin: getMargin(right: 32),
                          child: Text(
                              "We need your registration email to send you password reset code!",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular16)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: group1003Controller,
                          hintText: "Email",
                          margin: getMargin(top: 72),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      CustomButton(
                          height: getVerticalSize(52),
                          text: "Send Code",
                          margin: getMargin(top: 20, bottom: 5),
                          onTap: () {
                            onTapSendcode(context);
                          })
                    ]))));
  }

  onTapSendcode(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verificationCodeScreen);
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}

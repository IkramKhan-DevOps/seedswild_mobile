import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation%20layer/features/sign_in_screen/statemanagement/sign_in_provider.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore_for_file: must_be_immutable

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> mynamekey = GlobalKey<FormState>();
  GlobalKey<FormState> mypasswordkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<SignInProvider>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(55),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(60),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16),
                    onTap: () {
                      onTapArrowleft2(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Let’s Sign In")),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 16, top: 25, right: 16, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: getHorizontalSize(144),
                                  child: Text("Welcome\nBack!",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium30)),
                              CustomTextFormField(
                                  globalKey: mynamekey,
                                  focusNode: emailFocusNode,
                                  controller: nameController,
                                  hintText: "Name",
                                  onFieldSubmitted: () {
                                    CustomFocusNodes.feildFocusChnage(context,
                                        emailFocusNode, passwordFocusNode);
                                  },
                                  margin: getMargin(top: 49)),
                              CustomTextFormField(
                                  globalKey: mypasswordkey,
                                  focusNode: passwordFocusNode,
                                  controller: passController,
                                  hintText: "Password",
                                  margin: getMargin(top: 20),
                                  padding: TextFormFieldPadding.PaddingT14,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      loginProvider
                                          .setObsecure(); // Call a method to toggle obsecure
                                    },
                                    child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 18,
                                          right: 16,
                                          bottom: 18),
                                      child: loginProvider.obsecure
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(52)),
                                  isObscureText: loginProvider.obsecure),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtForgotPassword(context);
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 13),
                                          child: Text("Forgot Password",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsMedium14)))),
                              CustomButton(
                                  height: getVerticalSize(52),
                                  onTap: () {
                                    Map data = {
                                      "email": nameController.text.toString(),
                                      "password":
                                          passController.text.toString(),
                                    };
                                    loginProvider.SignInApi(data, context);
                                    // loginProvider.loginApi(
                                    //     context,
                                    //     nameController.text.toString(),
                                    //     passController.text.toString());
                                    // if (nameController.text.isEmpty) {
                                    //   CustomFlushBarMessage
                                    //       .flushbarErrorMessage(
                                    //           "Please enter a name",
                                    //           Colors.red,
                                    //           "Empty",
                                    //           context);
                                    // }else if (passController.text.isEmpty) {
                                    //   CustomFlushBarMessage
                                    //       .flushbarErrorMessage(
                                    //           "Please enter a password",
                                    //           Colors.red,
                                    //           "Empty",
                                    //           context);
                                    //}
                                  },
                                  text: loginProvider.loading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : "Sign In ",
                                  margin: getMargin(top: 121)),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtDonthaveanaccount(context);
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 14),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "Don’t have an account? ",
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .gray500,
                                                        fontSize:
                                                            getFontSize(13),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                TextSpan(
                                                    text: "Sign Up",
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .black900,
                                                        fontSize:
                                                            getFontSize(13),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                              textAlign: TextAlign.left)))),
                              Padding(
                                  padding: getPadding(top: 37),
                                  child: Row(children: [
                                    Padding(
                                        padding:
                                            getPadding(top: 17, bottom: 16),
                                        child: SizedBox(
                                            width: getHorizontalSize(100),
                                            child: Divider(
                                                height: getVerticalSize(2),
                                                thickness: getVerticalSize(2),
                                                color:
                                                    ColorConstant.black900))),
                                    Container(
                                        padding: getPadding(
                                            left: 10,
                                            top: 6,
                                            right: 10,
                                            bottom: 6),
                                        decoration: AppDecoration.fillWhiteA700,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      getPadding(bottom: 1),
                                                  child: Text(
                                                      "or continue with",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsRegular14Black900))
                                            ])),
                                    Padding(
                                        padding:
                                            getPadding(top: 17, bottom: 16),
                                        child: SizedBox(
                                            width: getHorizontalSize(100),
                                            child: Divider(
                                                height: getVerticalSize(2),
                                                thickness: getVerticalSize(2),
                                                color: ColorConstant.black900)))
                                  ])),
                              Padding(
                                  padding: getPadding(top: 27),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                            height: getVerticalSize(52),
                                            width: getHorizontalSize(164),
                                            text: "Google",
                                            variant:
                                                ButtonVariant.FillGray10001,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingT12,
                                            fontStyle: ButtonFontStyle
                                                .PoppinsRegular15Black900,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 16),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgGoogle))),
                                        CustomButton(
                                            height: getVerticalSize(52),
                                            width: getHorizontalSize(163),
                                            text: "Apple",
                                            variant:
                                                ButtonVariant.FillGray10001,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingT12,
                                            fontStyle: ButtonFontStyle
                                                .PoppinsRegular15Black900,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 16),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgUimapple)))
                                      ]))
                            ]))))));
  }

  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePage);
  }
}

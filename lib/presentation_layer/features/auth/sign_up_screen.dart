import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/auth/provider/sign_up_provider.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  // CONTROLLERS
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  // FOCUS NODES
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode password1FocusNode = FocusNode();
  final FocusNode password2FocusNode = FocusNode();

  // GLOBAL KEYS
  final GlobalKey<FormState> usernameGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> password1GlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> password2GlobalKey = GlobalKey<FormState>();

  // BUILD
  @override
  Widget build(BuildContext context) {
    var sigInUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TOP
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png", width: 200),
                  SizedBox(height: 10),
                  Text(
                    "First European Organic Seeds \nAI Powered Marketplace",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtPoppinsRegular127,
                  ),
                ],
              ),
            ),

            // MID
            Column(
              children: [

                // FIELDS
                CustomTextFormField(
                  globalKey: usernameGlobalKey,
                  focusNode: usernameFocusNode,
                  controller: usernameController,
                  hintText: "Username",
                ),
                CustomTextFormField(
                    globalKey: emailGlobalKey,
                    focusNode: emailFocusNode,
                    controller: emailController,
                    hintText: "Email",
                    margin: getMargin(top: 5),
                    textInputType: TextInputType.emailAddress),
                CustomTextFormField(
                  globalKey: password1GlobalKey,
                  focusNode: password1FocusNode,
                  controller: password1Controller,
                  hintText: "Password",
                  margin: getMargin(top: 5),
                  padding: TextFormFieldPadding.PaddingT14,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      sigInUpProvider.setObSecurePassword(
                          "p1"); // Call a method to toggle obsecure
                    },
                    child: Container(
                      margin:
                          getMargin(left: 30, top: 18, right: 16, bottom: 18),
                      child: sigInUpProvider.obSecurePassword1
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(52),
                  ),
                  isObscureText: sigInUpProvider.obSecurePassword1,
                ),
                CustomTextFormField(
                  globalKey: password2GlobalKey,
                  focusNode: password2FocusNode,
                  controller: password2Controller,
                  hintText: "Confirm Password",
                  margin: getMargin(top: 5),
                  padding: TextFormFieldPadding.PaddingT14,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      sigInUpProvider.setObSecurePassword(
                          "p2"); // Call a method to toggle obsecure
                    },
                    child: Container(
                      margin:
                          getMargin(left: 30, top: 18, right: 16, bottom: 18),
                      child: sigInUpProvider.obSecurePassword2
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(52),
                  ),
                  isObscureText: sigInUpProvider.obSecurePassword2,
                ),

                // LOWER
                CustomButton(
                  onTap: () {
                    Map data = {
                      "username": usernameController.text.toString(),
                      "email": emailController.text.toString(),
                      "password1": password1Controller.text.toString(),
                      "password2": password2Controller.text.toString(),
                    };
                    sigInUpProvider.signUpApi(data, context);
                  },
                  height: getVerticalSize(52),
                  text: sigInUpProvider.signUploading
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : "Sign Up ",
                  margin: getMargin(top: 20),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: getPadding(top: 14),
                      child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: ColorConstant.gray500,
                                    fontSize: getFontSize(13),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(13),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ),

              ],
            ),

            //LOWER
            Column(
              children: [
                Padding(
                  padding: getPadding(top: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: getHorizontalSize(100),
                        child: Divider(
                          height: getVerticalSize(2),
                          thickness: getVerticalSize(2),
                          color: ColorConstant.black900,
                        ),
                      ),
                      Container(
                        padding: getPadding(
                            left: 10, top: 6, right: 10, bottom: 6),
                        decoration: AppDecoration.fillWhiteA700,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(bottom: 1),
                              child: Text(
                                "or continue with",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Black900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 17, bottom: 16),
                        child: SizedBox(
                          width: getHorizontalSize(100),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.black900),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        height: getVerticalSize(52),
                        width: getHorizontalSize(164),
                        text: "Google",
                        variant: ButtonVariant.FillGray10001,
                        shape: ButtonShape.RoundedBorder7,
                        padding: ButtonPadding.PaddingT12,
                        fontStyle: ButtonFontStyle.PoppinsRegular15Black900,
                        prefixWidget: Container(
                          margin: getMargin(right: 16),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgGoogle),
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(52),
                        width: getHorizontalSize(163),
                        text: "Apple",
                        variant: ButtonVariant.FillGray10001,
                        shape: ButtonShape.RoundedBorder7,
                        padding: ButtonPadding.PaddingT12,
                        fontStyle: ButtonFontStyle.PoppinsRegular15Black900,
                        prefixWidget: Container(
                          margin: getMargin(right: 16),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgUimapple),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';
import 'package:annafi_app/presentation_layer/features/sign_in/sign_in_provider.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // CONTROLLERS
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // ON TAB BUTTON USE
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> mynamekey = GlobalKey<FormState>();
  GlobalKey<FormState> mypasswordkey = GlobalKey<FormState>();

  // DESTRUCTION IF WE MOVE TO NEXT SCREEN
  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

// URL METHOD
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // BUILD
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<SignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TOP
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //FIELDS AND FORGET PASS LINK
                  CustomTextFormField(
                    globalKey: mynamekey,
                    focusNode: emailFocusNode,
                    textInputType: TextInputType.emailAddress,
                    controller: nameController,
                    hintText: "example@exarth.com",
                    onFieldSubmitted: () {
                      CustomFocusNodes.feildFocusChnage(
                        context,
                        emailFocusNode,
                        passwordFocusNode,
                      );
                    },
                    margin: getMargin(top: 20),
                  ),
                  CustomTextFormField(
                    globalKey: mypasswordkey,
                    focusNode: passwordFocusNode,
                    controller: passController,
                    hintText: "********",
                    margin: getMargin(top: 20),
                    padding: TextFormFieldPadding.PaddingT14,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: GestureDetector(
                      onTap: () {
                        loginProvider
                            .setObSecure(); // Call a method to toggle obsecure
                      },
                      child: Container(
                        margin:
                        getMargin(left: 30, top: 18, right: 16, bottom: 18),
                        child: loginProvider.obSecure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(52),
                    ),
                    isObscureText: loginProvider.obSecure,
                  ),
                  // ADD FORGOTT URL
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        _launchURL(AppUrls.forgottPassword);
                        //  onTapTxtForgotPassword(context);
                      },
                      child: Padding(
                        padding: getPadding(top: 13),
                        child: Text(
                          "Forgot Password",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14,
                        ),
                      ),
                    ),
                  ),

                  // SIGN IN BTN, SIGNUP LINK
                  CustomButton(
                      height: getVerticalSize(52),
                      onTap: () {
                        Map data = {
                          "email": nameController.text.toString(),
                          "password": passController.text.toString(),
                        };
                        loginProvider.SignInApi(data, context);
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
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don’t have an account? ",
                                  style: TextStyle(
                                    color: ColorConstant.gray500,
                                    fontSize: getFontSize(13),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign Up",
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

              // LOWER
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
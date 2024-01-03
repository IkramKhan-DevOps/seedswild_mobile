import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/auth/provider/login_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // CONTROLLERS
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // ON TAB BUTTON USE
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  // DESTRUCTION IF WE MOVE TO NEXT SCREEN
  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  // BUILD
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TOP
            Column(
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

            // MID
            Column(
              children: [
                //FIELDS AND FORGET PASS LINK
                CustomTextFormField(
                  globalKey: nameKey,
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
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  globalKey: passwordKey,
                  focusNode: passwordFocusNode,
                  controller: passController,
                  hintText: "********",
                  padding: TextFormFieldPadding.PaddingT14,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      loginProvider
                          .setObSecure(); // Call a method to toggle ob secure
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
                SizedBox(height: 10),

                // ADD FORGOT URL
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPasswordScreen,
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium14,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // SIGN IN BTN, SIGNUP LINK
                CustomButton(
                  height: getVerticalSize(52),
                  onTap: () {
                    Map data = {
                      "email": nameController.text.toString(),
                      "password": passController.text.toString(),
                    };
                    loginProvider.loginAPI(data, context);
                  },
                  text: loginProvider.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : "Sign In ",
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUpScreen);
                    },
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
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // LOWER
            Column(
              children: [
                Row(
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
                      padding:
                          getPadding(left: 10, top: 6, right: 10, bottom: 6),
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
                          color: ColorConstant.black900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onTap: (){
                        context.read<LoginProvider>().handleGoogleSignIn(context);
                      },
                      height: getVerticalSize(52),
                      width: getHorizontalSize(164),
                      text: "Google",
                      variant: ButtonVariant.FillGray10001,
                      shape: ButtonShape.RoundedBorder7,
                      padding: ButtonPadding.PaddingT12,
                      fontStyle: ButtonFontStyle.PoppinsRegular15Black900,
                      prefixWidget: Container(
                        margin: getMargin(right: 16),
                        child:
                            CustomImageView(svgPath: ImageConstant.google),
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
                            svgPath: ImageConstant.apple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

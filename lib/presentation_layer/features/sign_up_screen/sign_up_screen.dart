import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/sign_up_screen/statemanagement/sign_up_provider.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore_for_file: must_be_immutable

class SignUpScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> mynamekey = GlobalKey<FormState>();
  GlobalKey<FormState> myemailkey = GlobalKey<FormState>();
  GlobalKey<FormState> mypasswordkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sigInUpProvider = Provider.of<SignUpProvider>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(45),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16),
                    onTap: () {
                      onTapArrowleft3(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Let’s Sign Up")),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 16, top: 26, right: 16, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(136),
                                  margin: getMargin(left: 8),
                                  child: Text("Create\nAccount!",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium30)),
                              CustomTextFormField(
                                  globalKey: mynamekey,
                                  focusNode: nameFocusNode,
                                  controller: usernameController,
                                  hintText: "Username",
                                  margin: getMargin(top: 49)),
                              CustomTextFormField(
                                  globalKey: myemailkey,
                                  focusNode: emailFocusNode,
                                  controller: emailController,
                                  hintText: "Email",
                                  margin: getMargin(top: 20),
                                  textInputType: TextInputType.emailAddress),
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
                                      sigInUpProvider
                                          .setObsecure(); // Call a method to toggle obsecure
                                    },
                                    child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 18,
                                          right: 16,
                                          bottom: 18),
                                      child: sigInUpProvider.obsecure
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(52)),
                                  isObscureText: sigInUpProvider.obsecure),
                              CustomButton(
                                  onTap: () {
                                    Map data = {
                                      "email": emailController.text.toString(),
                                      "password":
                                          passController.text.toString(),
                                    };
                                    sigInUpProvider.signUpApi(data, context);
                                    print("api hit");
                                    // onTapTxtAlreadyhavean(context);
                                  },
                                  height: getVerticalSize(52),
                                  text: sigInUpProvider.signUploading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : "Sign Up ",
                                  margin: getMargin(top: 84)),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtAlreadyhavean(context);
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 14),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "Already have an account? ",
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .gray500,
                                                        fontSize:
                                                            getFontSize(13),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                TextSpan(
                                                    text: "Sign In",
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
                                            width: getHorizontalSize(105),
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
                                            width: getHorizontalSize(105),
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

  onTapTxtAlreadyhavean(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}

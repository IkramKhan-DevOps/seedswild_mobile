import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 40, right: 16, bottom: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgUnsplashw7b3edub2i299x299,
                          height: getSize(280),
                          width: getSize(299),
                          radius: BorderRadius.circular(getHorizontalSize(149)),
                          margin: getMargin(top: 23)),
                      Container(
                          width: getHorizontalSize(186),
                          margin: getMargin(top: 81),
                          child: Text("Discover your\nShopping Here",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsMedium25)),
                      Container(
                          width: getHorizontalSize(304),
                          margin: getMargin(left: 20, top: 13, right: 19),
                          child: Text(
                              "It is a long established fact that a reader\nwill be distracted by the readable\ncontent of a page.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsRegular15)),
                      Padding(
                          padding: getPadding(top: 48),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    height: getVerticalSize(52),
                                    width: getHorizontalSize(164),
                                    text: "Register",
                                    onTap: () {
                                      onTapRegister(context);
                                    }),
                                CustomButton(
                                    height: getVerticalSize(52),
                                    width: getHorizontalSize(163),
                                    text: "Sign In",
                                    variant: ButtonVariant.FillGray200,
                                    fontStyle: ButtonFontStyle
                                        .PoppinsMedium16Black900_1,
                                    onTap: () {
                                      onTapSignin(context);
                                    })
                              ]))
                    ]))));
  }

  onTapRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  onTapSignin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}

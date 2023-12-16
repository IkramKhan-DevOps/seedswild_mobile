import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle_1.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';

class OnbordingThreeScreen extends StatefulWidget {
  @override
  State<OnbordingThreeScreen> createState() => _OnbordingThreeScreenState();
}

class _OnbordingThreeScreenState extends State<OnbordingThreeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 56,
                leading: AppbarImage(
                    height: getSize(40),
                    width: getSize(40),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 5, bottom: 5),
                    onTap: () {
                      onTapArrowleft1(context);
                    }),
                actions: [
                  AppbarSubtitle1(
                      text: "Get Started",
                      margin:
                          getMargin(left: 16, top: 11, right: 16, bottom: 11))
                ]),
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgOnbordingthree),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 44, top: 51, right: 44, bottom: 51),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          Text("All For You",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium24),
                          Container(
                              width: getHorizontalSize(285),
                              margin: getMargin(top: 14),
                              child: Text(
                                  "We always try provide the cool products\nand latest styles by maintaining the best\nquality for you.",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtPoppinsRegular14)),
                          Container(
                              height: getSize(80),
                              width: getSize(80),
                              margin: getMargin(top: 39),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: getSize(80),
                                        width: getSize(80),
                                        child: CircularProgressIndicator(
                                            value: 1))),
                                CustomIconButton(
                                    height: 60,
                                    width: 60,
                                    shape: IconButtonShape.CircleBorder30,
                                    alignment: Alignment.center,
                                    onTap: () {
                                      onTapBtnArrowright(context);
                                    },
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightBlack9001)),
                              ]))
                        ])))));
  }

  onTapBtnArrowright(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpSignInScreen);
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}

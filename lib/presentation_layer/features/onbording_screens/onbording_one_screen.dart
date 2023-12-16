import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';

class OnbordingOneScreen extends StatefulWidget {
  @override
  State<OnbordingOneScreen> createState() => _OnbordingOneScreenState();
}

class _OnbordingOneScreenState extends State<OnbordingOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgOnbordingone),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 13, right: 16, bottom: 13),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtSkip(context);
                                  },
                                  child: Text("Skip",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium18))),
                          Spacer(),
                          Text("Cool Product",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium24),
                          Container(
                              width: getHorizontalSize(285),
                              margin: getMargin(left: 29, top: 14, right: 29),
                              child: Text(
                                  "We create products in collaboration with\ngreat designers who are there to get the\ncoolest products for you.",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtPoppinsRegular14)),
                          Container(
                              height: getSize(80),
                              width: getSize(80),
                              margin: getMargin(top: 39, bottom: 37),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: getSize(80),
                                        width: getSize(80),
                                        child: CircularProgressIndicator(
                                            color: ColorConstant.mainGreenColor,
                                            value: 0.5))),
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

  onTapTxtSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpSignInScreen);
  }

  onTapBtnArrowright(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.onbordingTwoScreen);
  }
}

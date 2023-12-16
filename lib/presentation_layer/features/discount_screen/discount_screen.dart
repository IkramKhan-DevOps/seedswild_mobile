import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_subtitle.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'widget/discount_item_widget.dart';

class DiscountItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      onTapArrowleft17(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Discount Items")),
            body: Padding(
                padding: getPadding(left: 16, top: 24, right: 16),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(14));
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DiscountitemsItemWidget(
                          onTapRowunsplashqnuur0o5xeight: () {
                        onTapRowunsplashqnuur0o5xeight(context);
                      });
                    }))));
  }

  onTapRowunsplashqnuur0o5xeight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productViewScreen);
  }

  onTapArrowleft17(BuildContext context) {
    Navigator.pop(context);
  }
}

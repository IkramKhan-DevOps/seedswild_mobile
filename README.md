import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/profile_provider.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



class ProfileScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,

      //app bar
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      //body
      body:  Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // HEADER

            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: getVerticalSize(104),
                width: getHorizontalSize(92),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse591x92,
                      height: getVerticalSize(91),
                      width: getHorizontalSize(92),
                      radius: BorderRadius.circular(
                        getHorizontalSize(46),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    CustomIconButton(
                      height: 29,
                      width: 30,
                      variant: IconButtonVariant.OutlineWhiteA700,
                      padding: IconButtonPadding.PaddingAll6,
                      alignment: Alignment.bottomCenter,
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCamera,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium20,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular127,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
}
}

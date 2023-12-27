import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/globals/utils/auth.dart';
import 'package:annafi_app/presentation_layer/features/logout_bottomsheet/logout_bottomsheet.dart';
import 'package:annafi_app/presentation_layer/features/settings/components/menu_tile.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/profile_provider.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/progress.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: Provider.of<ProfileProvider>(context, listen: false)
              .getProfileAPICAll(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProgressCircular();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading user data"));
            } else {
              var data = Provider.of<ProfileProvider>(context).userModel;

              return Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // TOP AREA
                          Container(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SizedBox(height: 250),

                                // PROFILE - START
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: getPadding(left: 115, right: 115),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: getVerticalSize(104),
                                          width: getHorizontalSize(92),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                ImageConstant.imgEllipse592x92,
                                                height: getSize(92),
                                                width: getSize(92),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(46),
                                                ),
                                                alignment: Alignment.topCenter,
                                              ),
                                              CustomIconButton(
                                                height: 30,
                                                width: 30,
                                                variant:
                                                IconButtonVariant.OutlineWhiteA700,
                                                padding: IconButtonPadding.PaddingAll6,
                                                alignment: Alignment.bottomCenter,
                                                child: CustomImageView(
                                                  svgPath: ImageConstant.imgCamera,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${data!.firstName} ${data.lastName}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium20,
                                        ),
                                        Text(
                                          "${data.email}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular127,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // PROFILE - END
                              ],
                            ),
                          ),
                          SizedBox(height: 20),

                          // MENU ITEMS
                          MenuTile(
                            "My Profile",
                            Icons.person,
                                () =>
                                Navigator.pushNamed(context, AppRoutes.profileScreen),
                          ),
                          MenuTile(
                            "Password Change",
                            Icons.shield_outlined,
                                () =>
                                Navigator.pushNamed(
                                    context, AppRoutes.passwordChangeScreen),
                          ),

                          // SIGN OUT
                          Spacer(),
                          InkWell(
                            onTap: () {
                              AuthToken.logoutUser(context);
                            },
                            child: Container(
                              margin: getMargin(left: 16, right: 16, bottom: 37),
                              padding: getPadding(
                                  left: 120, top: 11, right: 120, bottom: 11),
                              decoration: AppDecoration.fillBlack900.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                  ),
                                  Text(
                                    "Logout",
                                    style: AppStyle.txtPoppinsRegular16WhiteA700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );


    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // TOP AREA
                  Container(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(height: 250),

                        // PROFILE - START
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: getPadding(left: 115, right: 115),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(104),
                                  width: getHorizontalSize(92),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                        ImageConstant.imgEllipse592x92,
                                        height: getSize(92),
                                        width: getSize(92),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(46),
                                        ),
                                        alignment: Alignment.topCenter,
                                      ),
                                      CustomIconButton(
                                        height: 30,
                                        width: 30,
                                        variant:
                                        IconButtonVariant.OutlineWhiteA700,
                                        padding: IconButtonPadding.PaddingAll6,
                                        alignment: Alignment.bottomCenter,
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgCamera,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Ana Maria",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium20,
                                ),
                                Text(
                                  "-",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular127,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // PROFILE - END
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // MENU ITEMS
                  MenuTile(
                    "My Profile",
                    Icons.person,
                        () =>
                        Navigator.pushNamed(context, AppRoutes.profileScreen),
                  ),
                  MenuTile(
                    "Password Change",
                    Icons.shield_outlined,
                        () =>
                        Navigator.pushNamed(
                            context, AppRoutes.passwordChangeScreen),
                  ),

                  // SIGN OUT
                  Spacer(),
                  InkWell(
                    onTap: () {
                      AuthToken.logoutUser(context);
                    },
                    child: Container(
                      margin: getMargin(left: 16, right: 16, bottom: 37),
                      padding: getPadding(
                          left: 120, top: 11, right: 120, bottom: 11),
                      decoration: AppDecoration.fillBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                          ),
                          Text(
                            "Logout",
                            style: AppStyle.txtPoppinsRegular16WhiteA700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapLogout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => LogoutBottomsheet(),
      isScrollControlled: true,
    );
  }
}

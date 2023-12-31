import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/globals/utils/auth.dart';
import 'package:seedswild/presentation_layer/features/logout_bottomsheet/logout_bottomsheet.dart';
import 'package:seedswild/presentation_layer/features/settings/components/menu_tile.dart';
import 'package:seedswild/presentation_layer/features/settings/statemanagement/profile_provider.dart';
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
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.verified_user_outlined, size: 100,
                                            color: Colors.green,
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
                            "Orders",
                            Icons.add_shopping_cart,
                                () =>
                                Navigator.pushNamed(context, AppRoutes.checkoutScreen),
                          ),

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
  }

  onTapLogout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => LogoutBottomsheet(),
      isScrollControlled: true,
    );
  }
}

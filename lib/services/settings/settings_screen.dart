import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/globals/utils/auth.dart';
import 'package:seedswild/services/settings/components/menu_tile.dart';
import 'package:seedswild/services/settings/statemanagement/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/widgets/buttons.dart';

import '../../../widgets/progress.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                                  SizedBox(height: 200),

                                  // PROFILE - START
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          getPadding(left: 50, right: 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(70),
                                              ),
                                              child: Icon(
                                                Icons.usb,
                                                size: 60,
                                                color: SeedsColor.primary,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "${data!.firstName} ${data.lastName}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                          Text(
                                            "${data.email}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 13,
                                              color: SeedsColor.primary,
                                            ),
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
                              () => Navigator.pushNamed(
                                  context, AppRoutes.ordersScreen),
                            ),
                            MenuTile(
                              "Subscription",
                              Icons.subscriptions,
                              () => Navigator.pushNamed(
                                  context, AppRoutes.subscriptionScreen),
                            ),

                            MenuTile(
                              "My Profile",
                              Icons.person,
                              () => Navigator.pushNamed(
                                  context, AppRoutes.profileScreen),
                            ),
                            MenuTile(
                              "Password Change",
                              Icons.shield_outlined,
                              () => Navigator.pushNamed(
                                  context, AppRoutes.passwordChangeScreen),
                            ),
                            MenuTile(
                              "Plants App",
                              Icons.energy_savings_leaf,
                                  () => Navigator.pushNamed(
                                  context, AppRoutes.plantsListScreen),
                            ),
                            

                            // SIGN OUT
                            Spacer(),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: SeedsElevatedButton(
                                title: "Logout",
                                icon: Icons.logout,
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  AuthToken.logoutUser(context);
                                },
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
      ),
    );
  }
}

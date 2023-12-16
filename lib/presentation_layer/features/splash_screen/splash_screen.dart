import 'dart:async';

import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';

import '../user_session/services/user_Services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserServices userServices = UserServices();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      userServices.checkUserAuthentication(context);
      Navigator.pushNamed(context, AppRoutes.onbordingOneScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 171,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgBag11,
                height: getSize(
                  191,
                ),
                width: getSize(
                  191,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 25,
                  bottom: 5,
                ),
                child: Text(
                  "ZAROZAR",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtQuicksandRegular32.copyWith(
                    letterSpacing: getHorizontalSize(
                      1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

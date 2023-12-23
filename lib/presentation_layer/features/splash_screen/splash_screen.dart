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
      Navigator.pushNamed(context, AppRoutes.signInScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(ImageConstant.logo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

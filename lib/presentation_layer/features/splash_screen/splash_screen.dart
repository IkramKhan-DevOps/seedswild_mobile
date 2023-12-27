import 'dart:async';

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/globals/utils/auth.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      AuthToken.checkLoginStatus(context);
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

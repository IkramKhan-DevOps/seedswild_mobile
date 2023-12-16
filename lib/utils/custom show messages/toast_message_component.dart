import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToastMessage {
  static void showToast(
    String message, {
    bool isLong = false,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}

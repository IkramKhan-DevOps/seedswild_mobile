import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushBarMessage {
  static void flushbarErrorMessage(
    String msg,
    Color backgroundColor,
    String title,
    BuildContext context, {
    IconData? iconData, // Make the icon dynamic
  }) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: msg,
        backgroundColor: backgroundColor,
        title: title,
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 3),
        messageColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(12),
        flushbarStyle: FlushbarStyle.FLOATING,
        icon: iconData != null
            ? Icon(
                iconData,
                color: Colors.white,
              )
            : null,
        shouldIconPulse: false,
      ),
    );
  }

  static void showFlushbar({
    required BuildContext context,
    required Flushbar flushbar,
  }) {
    flushbar.show(context);
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ErrorMessage {

  static Flushbar flushBar(BuildContext context, String message, [String tag = "success"]) {

    Color color = Colors.black87;
    Icon icon = Icon(Icons.question_mark_rounded, color: Colors.white);
    String? label = null;

    switch (tag) {
      case "danger":
        color = Colors.redAccent;
        icon = Icon(Icons.error, color: Colors.white);
        break;

      case "info":
        color = Colors.blueAccent;
        icon = Icon(Icons.info, color: Colors.white);
        break;

      case "warning":
        color = Colors.deepOrangeAccent;
        icon = Icon(Icons.warning, color: Colors.white);
        break;

      case "success":
        color = Colors.green;
        icon = Icon(Icons.check_circle, color: Colors.white);
        break;

      default:
        break;
    }

    return Flushbar(
      icon: icon,
      flushbarPosition: FlushbarPosition.TOP,
      message: message.toString(),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color,
    )..show(context);
  }
}

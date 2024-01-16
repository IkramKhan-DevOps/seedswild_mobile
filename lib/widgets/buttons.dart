import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class SeedsElevatedButton extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  const SeedsElevatedButton({
    super.key, required this.title, required this.icon,
    required this.onPressed,
    this.backgroundColor = SeedsColor.primary,
    this.foregroundColor = Colors.white,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18),
            Text(" " + title, style: TextStyle(fontSize: 18)),
          ],
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor ?? Colors.green,
          padding: padding ?? EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );
  }
}

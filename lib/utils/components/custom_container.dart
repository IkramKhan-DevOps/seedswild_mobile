import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  CustomRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = 16,
      this.child,
      this.showBorder = false,
      this.borderColor = const Color.fromARGB(217, 217, 217, 217),
      this.backrounColor,
      this.padding,
      this.margin});

  final Color? backrounColor;
  final Color borderColor;
  final Widget? child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final bool showBorder;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backrounColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}

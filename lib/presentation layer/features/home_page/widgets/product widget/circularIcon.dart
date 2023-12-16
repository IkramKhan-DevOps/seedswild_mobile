import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      required this.icon,
      this.width,
      this.height,
      this.size,
      this.color,
      this.backGroundColor,
      this.onTap,
      this.padding});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final padding;
  final Color? backGroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backGroundColor != null
              ? backGroundColor
              : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        padding: padding,
        onPressed: onTap,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}

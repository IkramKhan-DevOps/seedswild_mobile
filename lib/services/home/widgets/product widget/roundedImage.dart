// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;

  ///[imagePath] is required parameter for showing png,jpg,etc image
  String imagePath;

  ///[svgPath] is required parameter for showing svg image
  String? svgPath;

  ///[file] is required parameter for fetching image file
  File? file;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double borderRadius;
  final double? width;
  final Color? color;
  final Color? backgroundColor;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final bool applyImageRaius;

  ///a [CustomImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  RoundedImage({
    Key? key,
    this.url,
    required this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.backgroundColor = Colors.white,
    this.placeHolder = 'assets/images/image_not_found.png',
    this.padding,
    this.applyImageRaius = true,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
                border: border,
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: ClipRRect(
              borderRadius: applyImageRaius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.zero,
              child: Image(
                fit: fit,
                image: AssetImage(imagePath),
              ),
            )));
  }
}

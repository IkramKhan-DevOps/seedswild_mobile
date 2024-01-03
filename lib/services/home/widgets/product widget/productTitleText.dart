import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLine = 2,
      this.textAlign = TextAlign.left});

  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.titleMedium
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}

// for category

class categoryTitleText extends StatelessWidget {
  const categoryTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLine = 2,
      this.textAlign = TextAlign.left});

  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelSmall
          : Theme.of(context).textTheme.labelSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}

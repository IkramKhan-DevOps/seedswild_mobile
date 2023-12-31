import 'package:seedswild/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ProductShadow {
  static final verticalProductShadow = BoxShadow(
      color: ColorConstant.gray600.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));
}

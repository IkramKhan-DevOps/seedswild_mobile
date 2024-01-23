import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/utils/color_constant.dart';
import 'package:seedswild/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CustomSearchView extends StatelessWidget {
  CustomSearchView(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints});

  final SearchViewShape? shape;
  final SearchViewPadding? padding;
  final SearchViewVariant? variant;
  final SearchViewFontStyle? fontStyle;
  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSearchViewWidget(),
          )
        : _buildSearchViewWidget();
  }

  _buildSearchViewWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: GoogleFonts.aBeeZee(
          color: SeedsColor.primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: _buildDecoration(),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: GoogleFonts.aBeeZee(
        color: SeedsColor.primary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: Color.fromRGBO(229, 229, 229, 1),
      filled: true,
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case SearchViewVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return ColorConstant.gray20001;
    }
  }

  _setFilled() {
    switch (variant) {
      case SearchViewVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          top: 15,
          bottom: 15,
        );
    }
  }
}

enum SearchViewShape {
  RoundedBorder10,
}

enum SearchViewPadding {
  PaddingT14,
}

enum SearchViewVariant {
  None,
  FillGray10001,
}

enum SearchViewFontStyle {
  PoppinsLight12Gray500,
}

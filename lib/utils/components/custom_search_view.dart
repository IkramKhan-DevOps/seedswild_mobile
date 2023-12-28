import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

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
        style: TextStyle(
          fontSize: 18
        ),
        decoration: _buildDecoration(),

      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: TextStyle(
        fontSize: 18
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          height: getVerticalSize(
            1.50,
          ),
        );
    }
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

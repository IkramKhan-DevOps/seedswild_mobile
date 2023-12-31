import 'package:seedswild/core/utils/color_constant.dart';
import 'package:seedswild/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.validator,
    this.globalKey,
  });

  final GlobalKey<FormState>? globalKey;
  final TextFormFieldShape? shape;
  final TextFormFieldPadding? padding;
  final TextFormFieldVariant? variant;
  final TextFormFieldFontStyle? fontStyle;
  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final VoidCallback? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: Form(
        child: TextFormField(
          key: globalKey,
          controller: controller,
          focusNode: focusNode,
          style: _setFontStyle(),
          obscureText: isObscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: _buildDecoration(),
          validator: validator,
          onFieldSubmitted: (value) {
            // Call the onFieldSubmitted callback if provided
            if (onFieldSubmitted != null) {
              onFieldSubmitted!();
            }
          },
        ),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
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
      case TextFormFieldFontStyle.InterRegular14:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.21,
          ),
        );
      case TextFormFieldFontStyle.PoppinsRegular14Gray500:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.50,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.53,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
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
      case TextFormFieldVariant.OutlineGray20004:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray20004,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineGray10001:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray10001,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillGray20005:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.None:
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
      case TextFormFieldVariant.OutlineGray20004:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.FillGray20005:
        return ColorConstant.gray20005;
      default:
        return ColorConstant.gray20001;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray20004:
        return true;
      case TextFormFieldVariant.OutlineGray10001:
        return false;
      case TextFormFieldVariant.FillGray20005:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT14:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingT17:
        return getPadding(
          left: 16,
          top: 17,
          right: 16,
          bottom: 17,
        );
      case TextFormFieldPadding.PaddingAll4:
        return getPadding(
          all: 5,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  RoundedBorder16,
  RoundedBorder5,
}

enum TextFormFieldPadding {
  PaddingAll14,
  PaddingT14,
  PaddingT17,
  PaddingAll4,
}

enum TextFormFieldVariant {
  None,
  FillGray20001,
  OutlineGray20004,
  OutlineGray10001,
  FillGray20005,
}

enum TextFormFieldFontStyle {
  PoppinsRegular15Gray500,
  InterRegular14,
  PoppinsRegular14Gray500,
}

class CustomFocusNodes {
  static void feildFocusChnage(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

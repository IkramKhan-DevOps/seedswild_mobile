import 'package:seedswild/core/utils/color_constant.dart';
import 'package:seedswild/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  final ButtonShape? shape;
  final ButtonPadding? padding;
  final ButtonVariant? variant;
  final ButtonFontStyle? fontStyle;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final dynamic text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          _buildTextWidget(), // Use a helper method to handle text or widget
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return _buildTextWidget(); // Use a helper method to handle text or widget
    }
  }

  Widget _buildTextWidget() {
    if (text is Widget) {
      return text as Widget; // If text is a widget, return it
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT12:
        return getPadding(
          top: 14,
          right: 14,
          bottom: 14,
        );
      case ButtonPadding.PaddingAll4:
        return getPadding(
          all: 5,
        );
      default:
        return getPadding(
          all: 13,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillGray200:
        return ColorConstant.gray200;
      case ButtonVariant.FillGray10001:
        return ColorConstant.gray10001;
      default:
        return ColorConstant.mainGreenColor;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder7:
        return BorderRadius.circular(
          getHorizontalSize(
            7.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium16Black900_1:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.56,
          ),
        );
      case ButtonFontStyle.PoppinsRegular15Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.53,
          ),
        );
      case ButtonFontStyle.PoppinsRegular14Gray500:
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
      case ButtonFontStyle.PoppinsMedium15Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.53,
          ),
        );
      case ButtonFontStyle.PoppinsMedium15WhiteA700_1:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.53,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.56,
          ),
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder10,
  RoundedBorder7,
}

enum ButtonPadding {
  PaddingAll15,
  PaddingT12,
  PaddingAll4,
}

enum ButtonVariant {
  FillBlack900,
  FillGray200,
  FillGray10001,
}

enum ButtonFontStyle {
  PoppinsMedium16WhiteA700,
  PoppinsMedium16Black900_1,
  PoppinsRegular15Black900,
  PoppinsRegular14Gray500,
  PoppinsMedium15Black900,
  PoppinsMedium15WhiteA700_1,
}

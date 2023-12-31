import 'package:seedswild/core/app_export.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get txtFillGray600 => BoxDecoration(
        color: ColorConstant.gray600,
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: ColorConstant.gray10001,
      );
  static BoxDecoration get fillGray10002 => BoxDecoration(
        color: ColorConstant.gray10002,
      );
  static BoxDecoration get txtOutlineGray10001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray10001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtFillGray10001 => BoxDecoration(
        color: ColorConstant.gray10001,
      );
  static BoxDecoration get fillGray600 => BoxDecoration(
        color: ColorConstant.gray600,
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.mainGreenColor,
      );
  static BoxDecoration get mainColorGreen => BoxDecoration(
        color: ColorConstant.mainGreenColor,
      );
  static BoxDecoration get outlineGray20004 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtOutlineGray20002 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray20002,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get mainCoolor => BoxDecoration(
        border: Border.all(
          color: Color(0xFF417394),
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        color: ColorConstant.gray200.withOpacity(1),
        border: Border.all(
          color: ColorConstant.gray10001,
          width: 1.h,
        ),
      );
  static BoxDecoration get txtFillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get fillAmber500 => BoxDecoration(
        color: ColorConstant.amber500,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCustomBorderTL30 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
  );

  static BorderRadius customBorderTL20 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
  );

  static BorderRadius customBorderTL30 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
  );

  static BorderRadius customBorderBL25 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        25,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        25,
      ),
    ),
  );

  static BorderRadius customBorderBL12 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
  );

  static BorderRadius customBorderTL12 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
  );

  static BorderRadius txtRoundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius txtCustomBorderTL301 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius circleBorder46 = BorderRadius.circular(
    getHorizontalSize(
      46,
    ),
  );

  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24,
    ),
  );

  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder149 = BorderRadius.circular(
    getHorizontalSize(
      149,
    ),
  );

  static BorderRadius roundedBorder1 = BorderRadius.circular(
    getHorizontalSize(
      1,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius txtRoundedBorder7 = BorderRadius.circular(
    getHorizontalSize(
      7,
    ),
  );

  static BorderRadius customBorderTL301 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        20,
      ),
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;

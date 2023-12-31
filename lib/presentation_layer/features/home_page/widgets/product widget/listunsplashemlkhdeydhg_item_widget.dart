import 'package:seedswild/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListunsplashemlkhdeydhgItemWidget extends StatelessWidget {
  ListunsplashemlkhdeydhgItemWidget({this.onTapColumnunsplashemlkhdeydhg});

  VoidCallback? onTapColumnunsplashemlkhdeydhg;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          onTapColumnunsplashemlkhdeydhg?.call();
        },
        child: Padding(
          padding: getPadding(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  235,
                ),
                width: getHorizontalSize(
                  164,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Casual",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " ",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Jeans Shoes",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: ColorConstant.orange700,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " ",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "165.00",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

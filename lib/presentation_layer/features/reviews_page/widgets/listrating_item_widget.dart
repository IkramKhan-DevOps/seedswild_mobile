import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListratingItemWidget extends StatelessWidget {
  ListratingItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsRegular14Gray500,
        ),
        Container(
          height: getVerticalSize(
            4,
          ),
          width: getHorizontalSize(
            196,
          ),
          margin: getMargin(
            top: 9,
            bottom: 7,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: getHorizontalSize(
                    196,
                  ),
                  child: Divider(
                    height: getVerticalSize(
                      4,
                    ),
                    thickness: getVerticalSize(
                      4,
                    ),
                    color: ColorConstant.gray300,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: getHorizontalSize(
                    182,
                  ),
                  child: Divider(
                    height: getVerticalSize(
                      4,
                    ),
                    thickness: getVerticalSize(
                      4,
                    ),
                    color: ColorConstant.green600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

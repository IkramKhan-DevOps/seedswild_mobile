import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListdatatypeItemWidget extends StatelessWidget {
  ListdatatypeItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            top: 7,
            bottom: 9,
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
                child: Container(
                  height: getVerticalSize(
                    4,
                  ),
                  width: getHorizontalSize(
                    34,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.amber400,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        2,
                      ),
                    ),
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

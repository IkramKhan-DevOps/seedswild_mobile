import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class productsItems extends StatelessWidget {
  final VoidCallback? onTapProductItem;
  final String imagePath; // Add this line

  productsItems({
    Key? key,
    this.onTapProductItem,
    required this.imagePath, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 141.h,
      child: GestureDetector(
        onTap: () {
          onTapProductItem!.call();
        },
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
              border: Border.all(color: Colors.white)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageViewss(
                imagePath: imagePath, // Use the provided imagePath here
                height: 100.adaptSize,
                width: 100.adaptSize,
                radius: BorderRadius.circular(
                  5.h,
                ),
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 105.h,
                child: Text(
                  "msg_fs_nike_air_max".tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        height: 1.50,
                      ),
                ),
              ),
              SizedBox(height: 11.v),
              Text(
                "lbl_299_43".tr,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 9.v),
              Row(
                children: [
                  Text(
                    "lbl_534_33".tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "lbl_24_off".tr,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderRadiusStyles {
  // Circle borders
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

List<String> listOfImage = [
  ImageConstant.product1,
  ImageConstant.product2,
  ImageConstant.product3,
  ImageConstant.product4,
  ImageConstant.product5,
  ImageConstant.product6,
  ImageConstant.product7,
];

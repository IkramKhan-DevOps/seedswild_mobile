import 'package:annafi_app/core/constants/constants.dart';
import 'package:annafi_app/core/localization/app_localization.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/roundedImage.dart';
import 'package:annafi_app/utils/theme/app_decoration.dart';
import 'package:flutter/material.dart';


class SingleProductItemWidget extends StatelessWidget {
  SingleProductItemWidget({Key? key, this.onTapProductItem,}) : super(key: key,);
  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.h,
      child: GestureDetector(
        onTap: () {
          onTapProductItem!.call();
        },
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedImage(
                imagePath: ImageConstant.product1,
                // height: 90,
                // width: 90,
                radius: BorderRadius.circular(
                  5.h,
                ),
              ),
              SizedBox(height: 7.v),
              SizedBox(
                // width: 105.h,
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
import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/core/localization/app_localization.dart';
import 'package:annafi_app/utils/components/app_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardItemWidget extends StatelessWidget {
  const DashboardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                height: 274,
                width: 180,
                padding: EdgeInsets.all(15),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.grey[500],
                      child: CustomImageView(
                        imagePath: ImageConstant.perfume,
                        height: 190,
                        width: 160,
                        radius: BorderRadius.circular(
                          5,
                        ),
                      ),
                    ),
                    Text(
                      "msg_nike_air_max_270".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomRatingBar(
                      ignoreGestures: true,
                      initialRating: 4,
                    ),
                    Text(
                      "lbl_299_43".tr,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

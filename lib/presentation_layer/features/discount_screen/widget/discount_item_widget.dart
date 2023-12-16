import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/theme/app_decoration.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DiscountitemsItemWidget extends StatelessWidget {
  DiscountitemsItemWidget({this.onTapRowunsplashqnuur0o5xeight});

  final VoidCallback? onTapRowunsplashqnuur0o5xeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowunsplashqnuur0o5xeight?.call();
      },
      child: Container(
        padding: getPadding(
          left: 10,
          top: 8,
          right: 10,
          bottom: 8,
        ),
        decoration: AppDecoration.fillGray10001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgUnsplashqnuur0o5x858x586,
              height: getSize(
                58,
              ),
              width: getSize(
                58,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  10,
                ),
              ),
              margin: getMargin(
                top: 2,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 17,
                top: 2,
                bottom: 7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "50% Discount Items",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular15Black900,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 17,
                    ),
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemSize: getVerticalSize(
                        9,
                      ),
                      itemCount: 5,
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {},
                      itemBuilder: (context, _) {
                        return Icon(
                          Icons.star,
                          color: ColorConstant.amber400,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomImageView(
              svgPath: ImageConstant.imgArrowrightBlack900,
              height: getSize(
                16,
              ),
              width: getSize(
                16,
              ),
              margin: getMargin(
                top: 22,
                right: 6,
                bottom: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

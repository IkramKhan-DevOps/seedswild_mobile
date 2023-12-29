import 'package:annafi_app/core/utils/shadows.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/productTitleText.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/roundedImage.dart';
import 'package:annafi_app/utils/components/app_bar/custom_rating_bar.dart';
import 'package:annafi_app/utils/components/custom_container.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  final String imagePath; // New parameter to accept the image path

  CategoryProducts({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetailScreen);
      },
      child: Container(
        width: 140,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ProductShadow.verticalProductShadow],
          borderRadius: BorderRadius.circular(getSize(16)),
          color: Color.fromARGB(77, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRoundedContainer(
              height: 80,
              padding: EdgeInsets.all(10),
              backrounColor: Colors.white24,
              child: Stack(
                children: [
                  // Thumbnail Image
                  Positioned.fill(
                    child: RoundedImage(
                      imagePath: imagePath,
                      applyImageRaius: true,
                    ),
                  ),

                  // Discount Tag

                  // Favorite Icon
                ],
              ),
            ),

            // Details of the thumbnail image
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitleText(
                    title: 'Annafi Product',
                  ),
                  SizedBox(height: 6),

                  CustomRatingBar(
                    color: Colors.orangeAccent,
                    ignoreGestures: true,
                    initialRating: 4,
                  ),

                  // For Price
                  Container(
                    width: double.infinity, // Expand to full width
                    child: Text(
                      "\$40.99",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

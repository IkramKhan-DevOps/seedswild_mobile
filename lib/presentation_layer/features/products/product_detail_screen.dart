import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,

        // APP BAR
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: ColorConstant.whiteA700,

        // BODY
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(854),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        CustomImageView(
                          imagePath: ImageConstant.watch,
                          alignment: Alignment.topCenter,
                        ),

                        // Product details
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Product
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "category here",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        "product Name ....",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "(Shop Name)",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.shopping_cart, size: 40)
                                ],
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Product Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  shrinkWrap: true, // Allow it to take up only the necessary height
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Text("Value $index"),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$100   ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    "\$100",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),

                              // description
                              SizedBox(height: 10),
                              Text(
                                "Product Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "We use ads to keep our content free for you. "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "Please allow ads and let sponsors fund "
                                "your surfing.Thank you!",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

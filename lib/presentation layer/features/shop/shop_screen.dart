import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation%20layer/features/filter_draweritem/filter_draweritem.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/single_product_view.dart';
import 'package:annafi_app/utils/components/custom_search_view.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

final TextEditingController group848Controller = TextEditingController();

final TextEditingController group847Controller = TextEditingController();
TextEditingController group1305Controller = TextEditingController();

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomSearchView(
                      focusNode: FocusNode(),
                      controller: group1305Controller,
                      hintText: "Search",
                      margin: getMargin(left: 2, top: 10, right: 2),
                      prefix: Container(
                        margin: getMargin(all: 10),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgSearchGray50016x16,
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  onTapSUBSHOP(context);
                                },
                                child: Text(
                                  "ALL BRANDS",
                                  style: TextStyle(
                                      color: ColorConstant.mainGreenColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isDismissible: true,
                                      context: context,
                                      builder: (BuildContext contex) {
                                        return FilterDraweritem();
                                      });
                                },
                                child: Container(
                                    padding: getPadding(
                                        left: 13,
                                        top: 12,
                                        right: 14,
                                        bottom: 13),
                                    margin: getMargin(
                                        left: 5, top: 4, right: 0, bottom: 4),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.mainGreenColor,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(8))),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgSettings)),
                              )
                            ],
                          ),
                          // Container(
                          //   height: 120,
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         child: ListView(
                          //           shrinkWrap: true,
                          //           scrollDirection: Axis.horizontal,
                          //           children: List.generate(
                          //             ListgroupItemWidget.listOfImage.length,
                          //             (index) => Padding(
                          //               padding: EdgeInsets.only(right: 10),
                          //               child:
                          //                   ListgroupItemWidget(index: index),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 8),
                          Sales(
                            saleName: "More Products",
                            onTap: () {},
                            buttonTextName: '',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _buildDashboard(context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SingleProducts()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 298.v,
            crossAxisCount: 2,
            mainAxisSpacing: 7.h,
            crossAxisSpacing: 8.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 16,
        itemBuilder: (context, index) {
          return SingleProductItemWidget(
            onTapProductItem: () {
              onTapProductDetailedView(context);
            },
          );
        });
  }

  onTapProductDetailedView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productViewScreen);
  }

  onTapSUBSHOP(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.allShops);
  }

  onTapFilterView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.filterdrawer);
  }
}

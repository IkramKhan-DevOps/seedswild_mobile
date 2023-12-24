import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/custom_search_view.dart';
import 'package:flutter/material.dart';

import '../filter_draweritem/filter_draweritem.dart';
import '../home_page/widgets/product widget/banner.dart';

class SubShopsScreen extends StatefulWidget {
  const SubShopsScreen({super.key});

  @override
  State<SubShopsScreen> createState() => _SubShopsScreenState();
}

TextEditingController group1305Controller = TextEditingController();

class _SubShopsScreenState extends State<SubShopsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        body: SafeArea(
            child: Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomScrollView(slivers: [
                      SliverToBoxAdapter(
                          child: Column(children: [
                        Container(
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: getVerticalSize(160),
                                  width: double.maxFinite,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                              getPadding(left: 115, right: 115),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipOval(
                                                child: Container(
                                                  height: getVerticalSize(110),
                                                  width: getHorizontalSize(110),
                                                  padding: const EdgeInsets.all(
                                                      8), // Adjust padding as needed
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: ColorConstant
                                                          .mainGreenColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                55)), // Half of width
                                                  ),
                                                  child: Image.asset(
                                                    ImageConstant.brandNike,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Khadi Shop",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtPoppinsMedium20,
                                              ),
                                              Text(
                                                "Brand Clothes",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular127,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: getPadding(top: 5, bottom: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomSearchView(
                                          focusNode: FocusNode(),
                                          controller: group1305Controller,
                                          hintText: "Search",
                                          margin: getMargin(
                                              left: 16, top: 8, right: 16),
                                          prefix: Container(
                                              margin: getMargin(all: 16),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgSearchGray50016x16)),
                                          prefixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(48)),
                                          suffix: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  isDismissible: true,
                                                  context: context,
                                                  builder:
                                                      (BuildContext contex) {
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
                                                    left: 30,
                                                    top: 4,
                                                    right: 4,
                                                    bottom: 4),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .mainGreenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                8))),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgSettings)),
                                          ),
                                          suffixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(48))),
                                      Container(
                                        width: double.maxFinite,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ALL CATEGORIES",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .mainGreenColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            // Container(
                                            //   height: 120,
                                            //   child:
                                            //       Consumer<CategoriesProvider>(
                                            //     builder: (context,
                                            //         productCategoriesProvider,
                                            //         child) {
                                            //       if (productCategoriesProvider
                                            //               .productCategoryModels !=
                                            //           null) {
                                            //         return ListView.builder(
                                            //           shrinkWrap: true,
                                            //           scrollDirection:
                                            //               Axis.horizontal,
                                            //           itemCount:
                                            //               productCategoriesProvider
                                            //                   .productCategoryModels!
                                            //                   .length,
                                            //           itemBuilder:
                                            //               (context, index) {
                                            //             final category =
                                            //                 productCategoriesProvider
                                            //                         .productCategoryModels![
                                            //                     index];
                                            //             return Padding(
                                            //               padding:
                                            //                   EdgeInsets.only(
                                            //                       right: 10),
                                            //               child:
                                            //                   ListgroupItemWidget(
                                            //                 productImage:
                                            //                     category.image ??
                                            //                         '',
                                            //                 title:
                                            //                     category.name ??
                                            //                         '',
                                            //               ),
                                            //             );
                                            //           },
                                            //         );
                                            //       } else {
                                            //         return Center(
                                            //           child: SizedBox(
                                            //               height:
                                            //                   30, // Set your desired size
                                            //               width:
                                            //                   30, // Set your desired size
                                            //               child:
                                            //                   CircularProgressIndicator()),
                                            //         );
                                            //       }
                                            //     },
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
                                            // Consumer<AllProductsProvider>(
                                            //   builder: (context,
                                            //       allProductsProvider, child) {
                                            //     if (allProductsProvider
                                            //                 .allproductModels !=
                                            //             null &&
                                            //         allProductsProvider
                                            //             .allproductModels!
                                            //             .isNotEmpty) {
                                            //       print(
                                            //           "Enter GridView Builder");
                                            //       print(
                                            //           "Number of products: ${allProductsProvider.allproductModels!.length}");

                                            //       return GridView.builder(
                                            //         shrinkWrap: true,
                                            //         gridDelegate:
                                            //             SliverGridDelegateWithFixedCrossAxisCount(
                                            //           mainAxisExtent: 280.v,
                                            //           crossAxisCount: 2,
                                            //           mainAxisSpacing: 7.h,
                                            //           crossAxisSpacing: 8.h,
                                            //         ),
                                            //         physics:
                                            //             NeverScrollableScrollPhysics(),
                                            //         itemCount: 22,

                                            //         // allProductsProvider
                                            //         //     .allproductModels!.length,
                                            //         itemBuilder:
                                            //             (context, index) {
                                            //           final product =
                                            //               allProductsProvider
                                            //                       .allproductModels![
                                            //                   index];
                                            //           // print(
                                            //           //     "Product at index $index: ${product.title}");
                                            //           return SingleProductItemWidget(
                                            //             onTapProductItem: () {
                                            //               // onTapProductDetailedView(
                                            //               //     context, product);
                                            //             },
                                            //             productImage: product
                                            //                         .images
                                            //                         ?.isNotEmpty ??
                                            //                     false
                                            //                 ? product.images![0]
                                            //                 : 'No Products Available',
                                            //             productTitle:
                                            //                 product.title ?? '',
                                            //             productproductdescription:
                                            //                 '\$${(product.description ?? '').substring(0, 20)}...',

                                            //             originalPrice:
                                            //                 '\$${product.price ?? 0}', // Add your logic for original price
                                            //             // Add your logic for discount
                                            //           );
                                            //         },
                                            //       );
                                            //     } else {
                                            //       print(
                                            //           "No products or data not loaded");
                                            //       return Center(
                                            //         child: allProductsProvider
                                            //                     .allproductModels ==
                                            //                 null
                                            //             ? CircularProgressIndicator()
                                            //             : Text(
                                            //                 "No products are available"),
                                            //       );
                                            //     }
                                            //   },
                                            // )
                                          ],
                                        ),
                                      ),
                                      // SingleProducts()
                                    ],
                                  ),
                                ),
                              ]),
                        )
                      ]))
                    ])))));
  }

  onTapProductDetailedView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productViewScreen);
  }

  onTapFilterView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.filterdrawer);
  }
}

// onTapProductDetailedView(BuildContext context, AllProductsModel product) {
//   Navigator.pushNamed(
//     context,
//     AppRoutes.productViewScreen,
//     arguments: product,
//   );
// }
// Widget _buildDashboard(BuildContext context) {
//   return GridView.builder(
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: 298.v,
//           crossAxisCount: 2,
//           mainAxisSpacing: 7.h,
//           crossAxisSpacing: 8.h),
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: 16,
//       itemBuilder: (context, index) {
//         return SingleProductItemWidget();
//       });
// }

  
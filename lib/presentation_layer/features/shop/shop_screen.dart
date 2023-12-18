import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/filter_draweritem/filter_draweritem.dart';
import 'package:annafi_app/presentation_layer/features/home_page/statemanagement/categories_provider.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/utils/components/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchProductCategories();
    // Provider.of<AllProductsProvider>(context, listen: false).fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.backgrounColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    CustomSearchView(
                        focusNode: FocusNode(),
                        controller: group1305Controller,
                        hintText: "Search items here",
                        prefix: Container(
                            margin: getMargin(all: 16),
                            child: CustomImageView(
                                height: 25,
                                svgPath: ImageConstant.imgSearchGray50016x16)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(48)),
                        suffix: InkWell(
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
                                  left: 13, top: 12, right: 14, bottom: 13),
                              margin: getMargin(
                                  left: 30, top: 4, right: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  color: ColorConstant.black9003f,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8))),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgSettings)),
                        ),
                        suffixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(48))),
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
                              Text(
                                "ALL CATEGORIES",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 140, 131, 51),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  onTapSUBSHOP(context);
                                },
                                child: Text(
                                  "ALL BRANDS",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 140, 131, 51),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          // Container(
                          //   height: 120,
                          //   child: Consumer<CategoriesProvider>(
                          //     builder:
                          //         (context, productCategoriesProvider, child) {
                          //       if (productCategoriesProvider
                          //               .productCategoryModels !=
                          //           null) {
                          //         return ListView.builder(
                          //           shrinkWrap: true,
                          //           scrollDirection: Axis.horizontal,
                          //           itemCount: productCategoriesProvider
                          //               .productCategoryModels!.length,
                          //           itemBuilder: (context, index) {
                          //             final category = productCategoriesProvider
                          //                 .productCategoryModels![index];
                          //             return Padding(
                          //               padding: EdgeInsets.only(right: 10),
                          //               child: ListgroupItemWidget(
                          //                 productImage: category.image ?? '',
                          //                 title: category.name ?? '',
                          //               ),
                          //             );
                          //           },
                          //         );
                          //       } else {
                          //         return Center(
                          //           child: SizedBox(
                          //               height: 30, // Set your desired size
                          //               width: 30, // Set your desired size
                          //               child: CircularProgressIndicator()),
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
                          //   builder: (context, allProductsProvider, child) {
                          //     print(
                          //         "Debug: allproductModels: ${allProductsProvider.allproductModels}");
                          //     if (allProductsProvider.allproductModels !=
                          //             null &&
                          //         allProductsProvider
                          //             .allproductModels!.isNotEmpty) {
                          //       print("Enter GridView Builder");
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
                          //         physics: NeverScrollableScrollPhysics(),
                          //         itemCount: allProductsProvider
                          //             .allproductModels!.length,
                          //         itemBuilder: (context, index) {
                          //           final product = allProductsProvider
                          //               .allproductModels![index];
                          //           print(
                          //               "Debug: Product Image at index $index: ${product.images}");
                          //           product.images != null &&
                          //               product.images!.isNotEmpty;

                          //           print(
                          //               "Product at index $index: ${product.title}");
                          //           return SingleProductItemWidget(
                          //             onTapProductItem: () {
                          //               onTapProductDetailedView(
                          //                   context, product);
                          //             },
                          //             productImage:
                          //                 product.images?.isNotEmpty ?? false
                          //                     ? product.images![0]
                          //                     : 'No Products Available',
                          //             productTitle: product.title ?? '',
                          //             productproductdescription:
                          //                 '\$${(product.description ?? '').substring(0, 5)}...',

                          //             originalPrice:
                          //                 '\$${product.price ?? 0}', // Add your logic for original price
                          //             // Add your logic for discount
                          //           );
                          //         },
                          //       );
                          //     } else {
                          //       print("No products or data not loaded");
                          //       return Center(
                          //         child: allProductsProvider.allproductModels ==
                          //                 null
                          //             ? CircularProgressIndicator()
                          //             : Text("No products are available"),
                          //       );
                          //     }
                          //   },
                          // )
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

  // onTapProductDetailedView(BuildContext context, AllProductsModel product) {
  //   Navigator.pushNamed(
  //     context,
  //     AppRoutes.productViewScreen,
  //     arguments: product,
  //   );
  // }

  onTapSUBSHOP(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.allShops);
  }

  onTapFilterView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.filterdrawer);
  }
}

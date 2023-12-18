import 'dart:math';

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/carousel_slider.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/listgroup_item_widget.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/prouct_item_widget.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data_layer/models/product_categories_model.dart';
import '../statemanagement/categories_provider.dart';

class HomePageContent extends StatefulWidget {
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  void initState() {
    super.initState();
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.fetchProductCategories();
  }

  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),

      // APP BAR
      appBar: CustomAppBar(
        height: getVerticalSize(35),
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
          child: Text(
            "S E E D S W I L D",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        actions: [
          AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgSearch,
            margin: getMargin(left: 16),
            onTap: () {
              onTapsearchView(context);
            },
          ),
          AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgNotification,
            margin: getMargin(left: 24, right: 16),
            onTap: () {
              onTapNotificationView(context);
            },
          ),
        ],
      ),

      //BODY (CATEGORY AND PRODUCTS)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: CustomScrollView(
            slivers: [
              // SliverList for the initial content
              SliverList(
                delegate: SliverChildListDelegate([
                  // SLIDER
                  MySlider(),
                  SizedBox(height: 20),

                  // CATEGORIES
                  Sales(
                    saleName: "Categories",
                    buttonTextName: 'See All',
                    onTap: () {},
                  ),
                  SizedBox(height: 20),

                  Container(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                categoriesProvider.productCategories?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              ProductCategory? productCategory =
                                  categoriesProvider.productCategories?[index];
                              if (productCategory != null) {
                                print(productCategory.toString());
                                return ListgroupItemWidget(
                                  imagePath: productCategory.thumbnailImage ??
                                      "https://picsum.photos/200",
                                  categoryName: productCategory.name,
                                  onTap: () {
                                    // Handle category item click
                                  },
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // FLASH SALES
                  Sales(
                    saleName: 'Flash Sale',
                    onTap: () {
                      onTapshopView(context);
                    },
                    buttonTextName: 'See All',
                  ),
                  _buildFSNikeAirMax(context),
                  SizedBox(height: 10),

                  // TOP SALES
                  Sales(
                      saleName: 'Top Sale',
                      buttonTextName: 'See All',
                      onTap: () {
                        onTapshopView(context);
                      }),
                  _buildFSNikeAirMax(context),
                  SizedBox(height: 10),

                  // TRENDING
                  Sales(
                      saleName: "All Tranding",
                      buttonTextName: 'See All',
                      onTap: () {
                        onTapshopView(context);
                      }),
                  _buildFSNikeAirMax(context)
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFSNikeAirMax(BuildContext context) {
    var random = Random();

    return SizedBox(
      height: 230.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 8.h);
        },
        itemCount: listOfImage.length,
        itemBuilder: (context, index) {
          // Generate a random index
          int randomIndex = random.nextInt(listOfImage.length);

          return productsItems(
            imagePath: listOfImage[randomIndex],
            onTapProductItem: () {
              onTapProductView(context);
            },
          );
        },
      ),
    );
  }

  onTapNotificationView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  onTapProductView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productViewScreen);
  }

  onTapshopView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.shopScreen);
  }

  onTapsearchView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchPage);
  }
}
/*ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesProvider
                                        .productCategory?.products?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  Product? product = categoriesProvider
                                      .productCategory?.products?[index];
                                  if (product != null) {
                                    print(
                                        "Creating ListgroupItemWidget for index $index");
                                    return ListgroupItemWidget(
                                      imagePath: product.thumbnail ??
                                          "assets/icons/default_thumbnail.png",
                                      categoryName:
                                          (product.title ?? "Unknown Category")
                                              .substring(0, 5),
                                      onTap: () {
                                        // Handle category item click
                                      },
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )), */

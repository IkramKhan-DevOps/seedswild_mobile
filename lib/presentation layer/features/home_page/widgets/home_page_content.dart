import 'dart:math';

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/carousel_slider.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/listgroup_item_widget.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/prouct_item_widget.dart';
import 'package:annafi_app/utils/components/app_bar/appbar_image.dart';
import 'package:annafi_app/utils/components/app_bar/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data layer/models/product_categories_model.dart';
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
    print("Fetching product categories...");
    print(
        "Product Category Length: ${categoriesProvider.productCategory?.products?.length}");
  }

  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: CustomAppBar(
        height: getVerticalSize(35),
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
          child: Text(
            "Z A R O Z A R",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: ColorConstant.mainGreenColor),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: CustomScrollView(
            slivers: [
              // SliverList for the initial content
              SliverList(
                delegate: SliverChildListDelegate([
                  // SizedBox(height: 20),
                  MySlider(),
                  SizedBox(height: 20),
                  Sales(
                      saleName: "Category",
                      buttonTextName: 'See All',
                      onTap: () {}),
                  SizedBox(height: 20),
                  Container(
                    height: 120,
                    child: Row(children: [
                      Expanded(
                          child: ListView.builder(
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
                      )),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Sales(
                    saleName: 'Flash Sale',
                    onTap: () {
                      onTapshopView(context);
                    },
                    buttonTextName: 'See All',
                  ),
                  _buildFSNikeAirMax(context),
                  SizedBox(height: 10),
                  Sales(
                      saleName: 'Top Sale',
                      buttonTextName: 'See All',
                      onTap: () {
                        onTapshopView(context);
                      }),
                  _buildFSNikeAirMax(context),
                  SizedBox(height: 10),
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
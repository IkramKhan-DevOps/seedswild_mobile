import 'dart:math';

import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/home_page/statemanagement/home_provider.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/carousel_slider.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_widgets.dart';


class HomePageContent extends StatefulWidget {
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  // STATE
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<HomeProvider>(context, listen: false).homeAPICall(context);
    });

  }

  @override
  Widget build(BuildContext context) {

    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(

      //APP BAR
      appBar: AppBar(
        title: Text("SEEDS WILD",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.searchPage),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search_off, color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.notificationScreen),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.notification_add_outlined, color: Colors.white),
            ),
          ),
        ],
      ),

      //BODY
      body: homeProvider.isLoading? CircularProgressIndicator(): Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: CustomScrollView(
            slivers: [
              // SliverList for the initial content
              SliverList(
                delegate: SliverChildListDelegate([
                  // SLIDER
                  MySlider(),
                  SizedBox(height: 20),

                  Sales(
                    saleName: "Categories",
                    buttonTextName: 'See All',
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  CategoryCardList(
                    categoryList: homeProvider.homeModel!.categories,
                  ),


                  // FLASH SALES
                  SizedBox(height: 10),
                  Sales(
                    saleName: 'All Products',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.shopScreen);
                    },
                    buttonTextName: 'See All',
                  ),
                  ProductCardList(
                    productList: homeProvider.homeModel!.allProducts,
                  ),

                  SizedBox(height: 10),

                  // TOP SALES
                  Sales(
                      saleName: 'Top Rated',
                      buttonTextName: 'See All',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.shopScreen);
                      }),
                  ProductCardList(
                    productList: homeProvider.homeModel!.newProducts,
                  ),
                  SizedBox(height: 10),

                  // TOP SALES
                  Sales(
                      saleName: 'Most Sales',
                      buttonTextName: 'See All',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.shopScreen);
                      }),
                  ProductCardList(
                    productList: homeProvider.homeModel!.mostSales,
                  ),
                  SizedBox(height: 10),

                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
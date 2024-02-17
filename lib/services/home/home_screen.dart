import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/services/home/statemanagement/home_provider.dart';
import 'package:seedswild/services/home/widgets/product%20widget/banner.dart';
import 'package:seedswild/services/home/widgets/carousel_slider.dart';
import 'package:seedswild/services/home/widgets/product_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/progress.dart';
import 'widgets/category_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  // _launchURL() async {
  //   final Uri url = Uri.parse('https://flutter.dev');
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      backgroundColor: SeedsColor.background,
      appBar: AppBar(
        title: Text(
          "S E E D S  W I L D",
          style: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: SeedsColor.primary,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notificationScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child:
                  Icon(Icons.notifications_none_outlined, color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.plantsListScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              Icon(Icons.energy_savings_leaf_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: Provider.of<HomeProvider>(context, listen: false)
              .homeAPICall(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProgressCircular();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading user data"));
            } else {

              var data = Provider.of<HomeProvider>(context).homeModel;
              return Padding(
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
                          saleName: "C a t e g o r i e s",
                          onTap: () {},
                        ),
                        SizedBox(height: 20),
                        CategoryCardList(
                          categoryList: data!.categories,
                        ),

                        // FLASH SALES
                        SizedBox(height: 10),
                        Sales(
                          saleName: 'A l l  P r o d u c t s',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.productsScreen);
                          },
                        ),
                        SizedBox(height: 10),
                        ProductCardList(
                          productList: data.allProducts,
                        ),

                        SizedBox(height: 10),

                        // TOP SALES
                        Sales(
                          saleName: 'T o p  R a t e d',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.productsScreen);
                          },
                        ),
                        SizedBox(height: 10),
                        ProductCardList(
                          productList: data.newProducts,
                        ),
                        SizedBox(height: 10),

                        // TOP SALES
                        Sales(
                          saleName: 'M o s t  S a l e s',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.productsScreen);
                          },
                        ),
                        SizedBox(height: 10),
                        ProductCardList(
                          productList: data.mostSales,
                        ),
                        SizedBox(height: 10),
                      ]),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

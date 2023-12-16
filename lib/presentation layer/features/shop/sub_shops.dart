import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation%20layer/features/filter_draweritem/filter_draweritem.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/presentation%20layer/features/home_page/widgets/single_product_view.dart';
import 'package:annafi_app/utils/components/custom_search_view.dart';
import 'package:flutter/material.dart';

class SubShopsScreen extends StatefulWidget {
  const SubShopsScreen({super.key});

  @override
  State<SubShopsScreen> createState() => _SubShopsScreenState();
}

TextEditingController group1305Controller = TextEditingController();

class _SubShopsScreenState extends State<SubShopsScreen> {
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
              child: Column(
                children: [
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
                                  padding: getPadding(left: 115, right: 115),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              color:
                                                  ColorConstant.mainGreenColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
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
                                        style: AppStyle.txtPoppinsMedium20,
                                      ),
                                      Text(
                                        "Brand Clothes",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular127,
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
                                  margin:
                                      getMargin(left: 16, top: 8, right: 16),
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
                                            left: 30,
                                            top: 4,
                                            right: 4,
                                            bottom: 4),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.mainGreenColor,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(8))),
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgSettings)),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(48))),
                              // Container(
                              //   height: 120,
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: ListView(
                              //           shrinkWrap: true,
                              //           scrollDirection: Axis.horizontal,
                              //           children: List.generate(
                              //             ListgroupItemWidget
                              //                 .listOfImage.length,
                              //             (index) => Padding(
                              //               padding: EdgeInsets.only(right: 10),
                              //               child: ListgroupItemWidget(
                              //                   index: index),
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
          ]),
        ))));
  }

  onTapProductDetailedView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productViewScreen);
  }

  onTapFilterView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.filterdrawer);
  }
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
        return SingleProductItemWidget();
      });
}

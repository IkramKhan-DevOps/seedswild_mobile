import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/products/models/product_model.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:seedswild/services/products/widgets/products_search_drawer.dart';
import 'package:seedswild/utils/components/custom_search_view.dart';
import 'package:seedswild/widgets/empty.dart';
import 'package:seedswild/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../home/widgets/product_widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SeedsColor.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future:
            Provider.of<ProductsProvider>(context, listen: false).getProductsAPI(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ProgressCircular();
              } else if (snapshot.hasError) {
                return EmptyData(title: snapshot.error.toString());
              } else {
                ProductModel? product =
                    context.watch<ProductsProvider>().productModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // SEARCH AREA
                    SizedBox(
                      height: 20,
                    ),
        
                    CustomSearchView(
                      controller:
                          context.watch<ProductsProvider>().searchController,
                      focusNode: FocusNode(),
                      hintText: "Search Products",
                      prefix: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return ProductSearchDrawer();
                              },
                            );
                          },
                          child: Icon(
                            Icons.menu,
                            size: 24,
                          ),
                        ),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          Provider.of<ProductsProvider>(context, listen: false).filterProduct(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(8),
                            ),
                            color: SeedsColor.primary,
                          ),
                          child: Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
        
                    // LINE
                    SizedBox(height: 10),
                    Divider(),
        
                    // Use Expanded to allow GridView.builder to take all available space
                    Expanded(
                      child: GridView.builder(
                        itemCount: product!.results.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 300,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          var result = product.results[index];
                          return ProductCardItem(
                            id: result.id.toString(),
                            image: result.thumbnailImage,
                            name: result.title,
                            price: result.price.toString(),
                            discount: result.discount.toString(),
                            category: result.category.name,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

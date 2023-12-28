import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/filter_draweritem/filter_draweritem.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/product%20widget/banner.dart';
import 'package:annafi_app/utils/components/custom_search_view.dart';
import 'package:flutter/material.dart';

import '../home_page/widgets/product_widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final TextEditingController group848Controller = TextEditingController();
  final TextEditingController group847Controller = TextEditingController();
  final TextEditingController group1305Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // SEARCH AREA
            SizedBox(
              height: 20,
            ),
            CustomSearchView(
              focusNode: FocusNode(),
              controller: group1305Controller,
              hintText: "Search Products",
              prefix: Container(
                margin: getMargin(all: 16),
                child: Icon(
                  Icons.search,
                  size: 24,
                ),
              ),
              suffix: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return FilterDraweritem();
                    },
                  );
                },
                child: Container(
                  padding: getPadding(
                    left: 13,
                    top: 12,
                    right: 14,
                    bottom: 13,
                  ),
                  margin: EdgeInsets.only(right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(8),
                    ),
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 24,
                  ),
                ),
              ),
            ),

            // LINE
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),

            // Use Expanded to allow GridView.builder to take all available space
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ProductCardItem(
                    name: "name",
                    price: "100",
                    discount: "20",
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


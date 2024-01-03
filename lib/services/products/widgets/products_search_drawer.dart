import 'package:seedswild/services/home/statemanagement/home_provider.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:seedswild/services/products/widgets/products_category_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductSearchDrawer extends StatelessWidget {
  final TextEditingController group848Controller = TextEditingController();
  final TextEditingController group847Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                indent: 150,
                endIndent: 150,
                thickness: 6,
                color: Colors.green,
              ),

              // CATEGORY
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories"),
                  ProductCategoryCardList(
                    categoryList: context.watch<HomeProvider>().homeModel!.categories,
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Prices"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Minimum Price",
                              focusColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // Add some space between the text fields
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Maximum Price",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Actions"),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<ProductsProvider>().submitQuery(context);
                          Navigator.pop(context);
                        },
                        child: Text("Submit"),
                      ),
                      SizedBox(width: 16), // Add some space between the buttons
                      ElevatedButton(
                        onPressed: () {
                          context.read<ProductsProvider>().resetQuery(context);
                          Navigator.pop(context);
                        },
                        child: Text("Reset"),
                      ),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}


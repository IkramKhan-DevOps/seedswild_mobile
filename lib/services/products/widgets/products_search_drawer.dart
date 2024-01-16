import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/services/home/statemanagement/home_provider.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:seedswild/services/products/widgets/products_category_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/widgets/form_fields.dart';

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
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                  Text(
                    "Categories",
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      color: SeedsColor.primary,
                    ),
                  ),
                  ProductCategoryCardList(
                    categoryList:
                        context.watch<HomeProvider>().homeModel!.categories,
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prices",
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      color: SeedsColor.primary,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SeedsTextFormField(
                            hintText: 'Min Price',
                            prefixIcon: Icons.monetization_on_outlined,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      // Add some space between the text fields
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SeedsTextFormField(
                            hintText: 'Max Price',
                            prefixIcon: Icons.monetization_on_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),



              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // half width of available space
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SeedsColor.primary,
                            foregroundColor: Colors.white,
                            maximumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40,
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            context.read<ProductsProvider>().submitQuery(context);
                            Navigator.pop(context);
                          },
                          child: Text("Submit"),
                        ),// Add some space between the buttons
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            maximumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40,
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40,
                            ),
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

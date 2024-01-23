import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/services/home/statemanagement/home_provider.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:seedswild/services/products/widgets/products_category_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/widgets/buttons.dart';
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
          padding:
              const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                indent: 150,
                endIndent: 150,
                thickness: 3,
                color: Colors.green,
              ),

              const SizedBox(height: 10),
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

              const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SeedsTextFormField(
                          hintText: 'Min Price',
                          prefixIcon: Icons.monetization_on_outlined,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 5),
                      // Add some space between the text fields
                      Expanded(
                        child: SeedsTextFormField(
                          hintText: 'Max Price',
                          prefixIcon: Icons.monetization_on_outlined,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Actions",
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      color: SeedsColor.primary,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SeedsElevatedButton(
                          title: 'Submit',
                          icon: Icons.check,
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            context
                                .read<ProductsProvider>()
                                .submitQuery(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      // Add some space between the text fields
                      Expanded(
                        child: SeedsElevatedButton(
                          title: 'Reset',
                          icon: Icons.format_paint,
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            context
                                .read<ProductsProvider>()
                                .resetQuery(context);
                            Navigator.pop(context);
                          },
                        ),
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

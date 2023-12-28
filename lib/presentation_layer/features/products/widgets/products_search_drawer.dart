import 'package:annafi_app/presentation_layer/features/home_page/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../home_page/widgets/category_widgets.dart';

class ProductSearchDrawer extends StatelessWidget {
  final TextEditingController group848Controller = TextEditingController();
  final TextEditingController group847Controller = TextEditingController();

  final List<Category> categories = List.filled(
      10, Category(id: 1, name: "name", parent: null, thumbnailImage: null)
  );

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
                  CategoryCardList(
                    categoryList: categories,
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
                          // Handle submit button press
                        },
                        child: Text("Submit"),
                      ),
                      SizedBox(width: 16), // Add some space between the buttons
                      ElevatedButton(
                        onPressed: () {
                          // Handle reset button press
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


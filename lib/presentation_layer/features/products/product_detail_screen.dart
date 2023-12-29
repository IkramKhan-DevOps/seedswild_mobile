import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/products/models/product_detail_model.dart';
import 'package:annafi_app/presentation_layer/features/products/provider/product_detail_provider.dart';
import 'package:annafi_app/widgets/empty.dart';
import 'package:annafi_app/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  ProductDetailScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String?;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,

        // APP BAR
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: ColorConstant.whiteA700,

        // body
        body: Container(
          child: FutureBuilder(
            future: Provider.of<ProductDetailProvider>(context, listen: false)
                .getProductAPI(context, productId!),
            builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting){
                return ProgressCircular();
              }else if(snapshot.hasError){
                return EmptyData(
                  title: snapshot.error.toString(),
                );
              }else{

                ProductDetailModel? product = context.watch<ProductDetailProvider>().productModel;

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Image.network(
                                product?.thumbnailImage ?? "https://placehold.co/600x400/png"
                              ),

                              // Product details
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    // Product
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product!.category.name,
                                              style: TextStyle(
                                                color: Colors.green,
                                              ),
                                            ),
                                            Text(
                                              product.title,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              product.shop.shopName,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: Colors.green,
                                            ),
                                            child: Icon(
                                              Icons.add_shopping_cart,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),

                                    // product tags
                                    SizedBox(height: 20),
                                    Text(
                                      "Product Tags",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      height: 50,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: product.tags.length,
                                        shrinkWrap: true,
                                        // Allow it to take up only the necessary height
                                        itemBuilder: (context, index) {
                                          return TagTile(
                                              name: product.tags[index].name);
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${product.price}    ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Colors.green),
                                        ),
                                        product.discount > 0 ? Text(
                                          "${product.discount}% OFF",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                            color: Colors.red,
                                          ),
                                        ): Text(""),
                                      ],
                                    ),

                                    // description
                                    SizedBox(height: 10),
                                    Text(
                                      "Product Description",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      product.description,
                                    ),

                                    // detailed
                                    SizedBox(height: 10),
                                    Text(
                                      "Content",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      product.content,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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

class TagTile extends StatelessWidget {
  final String name;

  const TagTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "$name",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

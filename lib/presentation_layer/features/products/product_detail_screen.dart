import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/presentation_layer/features/cart/cart_provider.dart';
import 'package:seedswild/presentation_layer/features/products/models/product_detail_model.dart';
import 'package:seedswild/presentation_layer/features/products/provider/product_detail_provider.dart';
import 'package:seedswild/widgets/empty.dart';
import 'package:seedswild/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart_model.dart';

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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ProgressCircular();
              } else if (snapshot.hasError) {
                return EmptyData(
                  title: snapshot.error.toString(),
                );
              } else {
                ProductDetailModel? product =
                    context.watch<ProductDetailProvider>().productModel;

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
                              Image.network(product?.thumbnailImage ??
                                  "https://placehold.co/600x400/png"),

                              // Product details
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Product
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
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "by ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              TextSpan(
                                                text: product.shop.shopName,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "\$${product.price}    ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Colors.green),
                                        ),
                                        product.discount > 0
                                            ? Text(
                                                "( ${product.discount}% OFF )",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                ),
                                              )
                                            : Text(""),
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

                                    // product tags
                                    SizedBox(height: 20),
                                    Divider(),
                                    Text(
                                      "Tags: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
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

                                    // button
                                    InkWell(
                                      onTap: (){

                                        bool result = Provider.of<CartProvider>(context, listen: false).doesCartItemExist(product.id.toString());
                                        if(result){
                                          ErrorMessage.flushBar(context, "Already exists", "danger");
                                        }else{
                                          Cart cart = Cart(
                                              id: product.id.toString(),
                                              name: product.title,
                                              category: product.category.name,
                                              price: product.price,
                                              quantity: 1,
                                              image: product.thumbnailImage
                                          );
                                          Provider.of<CartProvider>(context, listen: false).addToCart(cart);
                                          ErrorMessage.flushBar(context, "Product added to cart");
                                        }
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_shopping_cart_rounded,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Add To Cart",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
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

import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartTile extends StatelessWidget {
  final int index;
  final String id;

  CartTile({
    required this.index,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // IMAGE
            CustomImageView(
              url: cartProvider.cart[index].image ??
                  "https://placehold.co/200/png",
              height: getVerticalSize(120),
              width: getHorizontalSize(100),
              radius: BorderRadius.circular(getHorizontalSize(20)),
              margin: getMargin(top: 5, bottom: 2),
            ),

            // OTHER DETAILS
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      cartProvider.cart[index].name,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium18Black900,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      cartProvider.cart[index].category,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular14Gray500,
                    ),
                    Text(
                      "${(cartProvider.cart[index].price * cartProvider.cart[index].quantity).toStringAsFixed(1)}",
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              
                    // DOWN
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cartProvider.decreaseItem(index);
                              },
                              child: Icon(Icons.remove),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                  cartProvider.cart[index].quantity.toString(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                            InkWell(
                              onTap: () {
                                cartProvider.increaseItem(index);
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () => cartProvider.deleteItem(index),
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red),
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.white),
                                Text("Delete", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

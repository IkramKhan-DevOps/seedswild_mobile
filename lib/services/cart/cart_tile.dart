import 'package:seedswild/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_provider.dart';

class CartTile extends StatelessWidget {
  final Cart cart;
  final int index;

  CartTile({
    required this.cart,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // IMAGE
        CustomImageView(
          url: cart.image ??
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
                  cart.name,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium18Black900,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cart.category,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular14Gray500,
                ),
                Text(
                  "${(cart.price * cart.quantity).toStringAsFixed(1)}",
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
                            context.read<CartProvider>().decreaseItem(index);
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
                              cart.quantity.toString(),
                              style: TextStyle(fontSize: 18)),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<CartProvider>().increaseItem(index);
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: () => context.read<CartProvider>().deleteItem(index),
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
  }
}

import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartTile extends StatelessWidget {

  final int index;
  final String id;
  final String name;
  final String category;
  final String price;
  final String quantity;
  final String? image;

  CartTile(
      {required this.index,
      required this.id,
        required this.name,
        required this.category,
        required this.price,
        required this.quantity,
        this.image,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // IMAGE
        CustomImageView(
          url: image ?? "https://placehold.co/200/png",
          height: getVerticalSize(120),
          width: getHorizontalSize(100),
          radius: BorderRadius.circular(getHorizontalSize(20)),
          margin: getMargin(top: 5, bottom: 2),
        ),

        // OTHER DETAILS
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium18Black900,
              ),
              Text(
                category,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular14Gray500,
              ),
              Text(
                price,
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
                children: [
                  InkWell(
                    onTap: () {},
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
                    child:
                        Text(quantity, style: TextStyle(fontSize: 18)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.add),
                  ),
                ],
              ),

              SizedBox(height: 10),
              InkWell(
                onTap: ()=> context.read<CartProvider>().deleteItem(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: Colors.red),
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
        ),
      ],
    );
  }
}

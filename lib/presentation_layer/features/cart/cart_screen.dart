import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_provider.dart';
import 'cart_tile.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Cart> cart = Provider.of<CartProvider>(context, listen: false).cart;

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,

      // bar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Cart", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // LIST
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: getVerticalSize(14),
                  );
                },
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return CartTile(
                    index: index,
                    id: cart[index].id,
                    name: cart[index].name,
                    category: cart[index].category,
                    price: cart[index].price,
                    quantity: cart[index].quantity,
                    image: cart[index].image,
                  );
                },
              ),

              // CALCULATIONS
              SizedBox(height: 20),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Charges",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "10.2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Charges",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "5.0",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "15.2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // BUTTON
              SizedBox(height: 20),
              CustomButton(
                height: getVerticalSize(52),
                text: "Checkout",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.checkoutScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

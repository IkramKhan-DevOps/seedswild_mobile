import 'package:provider/provider.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/empty.dart';
import '../cart/cart_model.dart';
import '../cart/cart_provider.dart';
import '../cart/cart_tile.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Cart> cart = Provider.of<CartProvider>(context, listen: false)
        .cart; // Default country
    Provider.of<CartProvider>(context, listen: false).calculate();

    String selectedCountry = "France";
    String selectedPaymentMethod = "Cash on Delivery";
    List<String> countries = ["France", "Germany", "Italy", "Spain", "UK"];
    List<String> paymentMethods = ["Cash on Delivery", "Online Payment"];

    return Scaffold(
      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Checkout", style: TextStyle(color: Colors.white)),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: ColorConstant.whiteA700,

      // BODY
      body: cart.length < 1
          ? EmptyData(title: "No items added to cart")
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // CART ITEMS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cart Items",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium18Black900,
                        ),
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
                            Cart c = cart[index];
                            return CartTile(
                              index: index,
                              cart: c,
                            );
                          },
                        ),

                        // CALCULATIONS
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
                                context.watch<CartProvider>().total.toString(),
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
                                context
                                    .watch<CartProvider>()
                                    .deliveryCharges
                                    .toString(),
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
                                context
                                    .watch<CartProvider>()
                                    .subTotal
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    Divider(),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Address",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium18Black900,
                          ),

                          //NAME
                          SizedBox(height: 10),
                          Text("Full Name"),
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            hintText: "Mark I",
                          ),

                          //CONTACT
                          SizedBox(height: 10),
                          Text("Contact"),
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            hintText: "+33 6 12 34 56 78",
                          ),

                          //POSTAL CODE
                          SizedBox(height: 10),
                          Text("Postal Code"),
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            hintText: "75001",
                          ),

                          // ADDRESS
                          SizedBox(height: 10),
                          Text("Address"),
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            hintText: "123 Rue de l' Eiffel",
                            maxLines: 2,
                          ),

                          // STATE
                          SizedBox(height: 10),
                          Text("State"),
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            hintText: "Île-de-France",
                          ),

                          // COUNTRY SELECT FIELD
                          SizedBox(height: 10),
                          Text("Country"),
                          DropdownButton<String>(
                            value: selectedCountry,
                            items: countries.map((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ],
                      ),
                    ),
                    Divider(),

                    // PAYMENT METHOD
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Method",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium18Black900,
                          ),

                          // COUNTRY SELECT FIELD
                          DropdownButton<String>(
                            value: selectedPaymentMethod,
                            items: paymentMethods.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ],
                      ),
                    ),

                    // BUTTON
                    CustomButton(
                      height: getVerticalSize(52),
                      text: "Pay Now",
                      onTap: () {
                        // Navigator.pushNamed(context, AppRoutes.completeScreen);
                        // launch some url here using url_launcher package
                        launch("https://www.google.com");
                        
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
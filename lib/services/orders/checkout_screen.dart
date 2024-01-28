import 'package:provider/provider.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/globals/providers/general_providers.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';

import '../../../globals/models/general_models.dart';
import '../../../widgets/empty.dart';
import '../cart/cart_model.dart';
import '../cart/cart_provider.dart';
import '../cart/cart_tile.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Cart> cart = Provider.of<CartProvider>(context, listen: false).cart;
    Provider.of<CartProvider>(context, listen: false).calculate();


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
                            controller: context.watch<GeneralProvider>().nameController,
                            textInputType: TextInputType.name,
                            hintText: "Mark I",
                          ),

                          //CONTACT
                          SizedBox(height: 10),
                          Text("Contact"),
                          CustomTextFormField(
                            controller: context.watch<GeneralProvider>().contactController,
                            textInputType: TextInputType.phone,
                            hintText: "+33 6 12 34 56 78",
                          ),

                          //POSTAL CODE
                          SizedBox(height: 10),
                          Text("Postal Code"),
                          CustomTextFormField(
                            controller: context.watch<GeneralProvider>().postalCodeController,
                            textInputType: TextInputType.text,
                            hintText: "75001",
                          ),

                          // ADDRESS
                          SizedBox(height: 10),
                          Text("Address"),
                          CustomTextFormField(
                            controller: context.watch<GeneralProvider>().addressController,
                            textInputType: TextInputType.streetAddress,
                            hintText: "123 Rue de l' Eiffel",
                            maxLines: 2,
                          ),

                          // CITY
                          SizedBox(height: 10),
                          Text("City"),
                          CustomTextFormField(
                            controller: context.watch<GeneralProvider>().cityController,
                            textInputType: TextInputType.name,
                            hintText: "Paris",
                          ),

                          // STATE
                          SizedBox(height: 10),
                          Text("State"),
                          CustomTextFormField(
                            controller: context.watch<GeneralProvider>().stateController,
                            textInputType: TextInputType.name,
                            hintText: "Île-de-France",
                          ),

                          // COUNTRY SELECT FIELD
                          Consumer<GeneralProvider>(
                            builder: (context, generalProvider, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("Country"),
                                  DropdownButton<String>(
                                    value: generalProvider.selectedCountry ?? (generalProvider.countries.isNotEmpty ? generalProvider.countries.first.name : null),
                                    items: generalProvider.countries.map((CountryModel country) {
                                      return DropdownMenuItem<String>(
                                        value: country.name,
                                        child: Text(country.name),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      // Update the selectedCountry when a new item is selected
                                      generalProvider.selectedCountry = value!;
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),

                    // PAYMENT METHOD
                    Consumer<GeneralProvider>(
                      builder: (context, generalProvider, child) {
                        return Container(
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

                              // PAYMENT METHOD SELECT FIELD
                              DropdownButton<String>(
                                value: generalProvider.selectedPaymentMethod ?? generalProvider.paymentMethods.keys.first,
                                items: generalProvider.paymentMethods.keys.map((String key) {
                                  return DropdownMenuItem<String>(
                                    value: key,
                                    child: Text('${generalProvider.paymentMethods[key]}'),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  // Update the selectedPaymentMethod when a new item is selected
                                  generalProvider.selectedPaymentMethod = value!;
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // BUTTON
                    CustomButton(
                      height: getVerticalSize(52),
                      text: "Pay Now",
                      onTap: () {
                        context.read<GeneralProvider>().submitOrder(context, cart);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
